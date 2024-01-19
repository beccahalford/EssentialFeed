//
//  SceneDelegate.swift
//  EssentialApp
//
//  Created by Rebecca Woodman-Halford on 05/01/2024.
//

import UIKit
import CoreData
import Combine
import EssentialFeed
import EssentialFeediOS

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private lazy var httpClient: HTTPClient = {
        URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
    }()
    private lazy var store: FeedStore & FeedImageDataStore = {
        try! CoreDataFeedStore(storeURL: NSPersistentContainer
            .defaultDirectoryURL()
            .appendingPathComponent("feed-store.sqlite"))
    }()
    private let remoteURL = URL(string: "https://ile-api.essentialdeveloper.com/essential-feed/v1/feed")!
    private lazy var localFeedLoader: LocalFeedLoader = {
        LocalFeedLoader(store: store, currentDate: Date.init)
    }()
    private lazy var remoteFeedLoader = {
//        let url = URL(string: "https://ile-api.essentialdeveloper.com/essential-feed/v1/feed")!
//        return RemoteFeedLoader(url: url, client: httpClient)
        return RemoteLoader(url: remoteURL, client: httpClient, mapper: FeedItemsMapper.map)
    }()
    
    convenience init(httpClient: HTTPClient, store: FeedStore & FeedImageDataStore) {
        self.init()
        self.httpClient = httpClient
        self.store = store
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        configureWindow()
        
    }
    
    func configureWindow() {
        let feedViewController = FeedUIComposer.feedComposedWith(feedLoader: makeRemoteFeedLoaderWithLocalFallback,
                                                                 imageLoader: makeLocalImageLoaderWithRemoteFallback)
        window?.rootViewController = UINavigationController(rootViewController: feedViewController)
        window?.makeKeyAndVisible()
    }
    
//    func configureWindow() {
//        let remoteURL = URL(string: "https://ile-api.essentialdeveloper.com/essential-feed/v1/feed")!
////        let remoteClient = makeRemoteClient()
//        let remoteFeedLoader = RemoteFeedLoader(url: remoteURL, client: httpClient)
//        let remoteImageLoader = RemoteFeedImageDataLoader(client: httpClient)
//        
//        let localImageLoader = LocalFeedImageDataLoader(store: store)
//        
//        let feedViewController = FeedUIComposer.feedComposedWith(
//            feedLoader: FeedLoaderWithFallbackComposite(primary: FeedLoaderCacheDecorator(decoratee: remoteFeedLoader,
//                                                                                          cache: localFeedLoader),
//                                                        fallback: localFeedLoader),
//            imageLoader: FeedImageDataLoaderWithFallbackComposite(primary: localImageLoader,
//                                                                  fallback: FeedImageDataLoaderCacheDecorator(
//                                                                    decoratee: remoteImageLoader,
//                                                                    cache: localImageLoader)))
//        
//        window?.rootViewController = UINavigationController(rootViewController: feedViewController)
//        window?.makeKeyAndVisible()
//    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        localFeedLoader.validateCache { _ in }
    }
    
    private func makeRemoteFeedLoaderWithLocalFallback() -> AnyPublisher<[FeedImage], Error> {
        return httpClient
            .getPublisher(url: remoteURL)
            .tryMap(FeedItemsMapper.map)
            .caching(to: localFeedLoader)
            .fallback(to: localFeedLoader.loadPublisher)
//        remoteFeedLoader
//            .loadPublisher()
//            .caching(to: localFeedLoader)
//            .fallback(to: localFeedLoader.loadPublisher)
    }
    
    private func makeLocalImageLoaderWithRemoteFallback(url: URL) -> FeedImageDataLoader.Publisher {
//        let remoteImageLoader = RemoteFeedImageDataLoader(client: httpClient)
        let localImageLoader = LocalFeedImageDataLoader(store: store)

//        return localImageLoader
//            .loadImageDataPublisher(from: url)
//            .fallback(to: {
//                remoteImageLoader
//                    .loadImageDataPublisher(from: url)
//                    .caching(to: localImageLoader, using: url)
//            })
        return localImageLoader
            .loadImageDataPublisher(from: url)
            .fallback(to: { [httpClient] in
                httpClient
                    .getPublisher(url: url)
                    .tryMap(FeedImageDataMapper.map)
                    .caching(to: localImageLoader, using: url)
            })
    }

//    func makeRemoteClient() -> HTTPClient {
//        httpClient
//    }
    
}

//extension RemoteLoader: FeedLoader where Resource == [FeedImage] {}

//public typealias RemoteFeedLoader = RemoteLoader<[FeedImage]>
//
//public extension RemoteFeedLoader {
//    convenience init(url: URL, client: HTTPClient) {
//        self.init(url: url, client: client, mapper: FeedItemsMapper.map)
//    }
//}

//public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>
//
//public extension RemoteImageCommentsLoader {
//    convenience init(url: URL, client: HTTPClient) {
//        self.init(url: url, client: client, mapper: ImageCommentsMapper.map)
//    }
//}
