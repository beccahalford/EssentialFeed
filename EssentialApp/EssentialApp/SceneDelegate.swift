//
//  SceneDelegate.swift
//  EssentialApp
//
//  Created by Rebecca Woodman-Halford on 05/01/2024.
//

import UIKit
import CoreData
import EssentialFeed
import EssentialFeediOS

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let localStoreURL = NSPersistentContainer.defaultDirectoryURL().appendingPathComponent("feed-store.sqlite")
    
    private lazy var httpClient: HTTPClient = {
        URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
    }()
    private lazy var store: FeedStore & FeedImageDataStore = {
        try! CoreDataFeedStore(storeURL: localStoreURL)
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
        configureWindow()
        
    }
    
    func configureWindow() {
        let remoteURL = URL(string: "https://ile-api.essentialdeveloper.com/essential-feed/v1/feed")!
        let remoteClient = makeRemoteClient()
        let remoteFeedLoader = RemoteFeedLoader(url: remoteURL, client: remoteClient)
        let remoteImageLoader = RemoteFeedImageDataLoader(client: remoteClient)
        
        let localFeedLoader = LocalFeedLoader(store: store, currentDate: Date.init)
        let localImageLoader = LocalFeedImageDataLoader(store: store)
        
        let feedViewController = FeedUIComposer.feedComposedWith(
            feedLoader: FeedLoaderWithFallbackComposite(primary: FeedLoaderCacheDecorator(decoratee: remoteFeedLoader,
                                                                                          cache: localFeedLoader),
                                                        fallback: localFeedLoader),
            imageLoader: FeedImageDataLoaderWithFallbackComposite(primary: localImageLoader,
                                                                  fallback: FeedImageDataLoaderCacheDecorator(
                                                                    decoratee: remoteImageLoader,
                                                                    cache: localImageLoader)))
        
        window?.rootViewController = UINavigationController(rootViewController: feedViewController)
    }
    
    func makeRemoteClient() -> HTTPClient {
        httpClient
    }
}
