//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Rebecca Woodman-Halford on 10/12/2023.
//

import Combine
import EssentialFeed
import EssentialFeediOS
import UIKit

public final class FeedUIComposer {
    private init() {}
    
    private typealias FeedPresentationAdapter = LoadResourcePresentationAdapter<Paginated<FeedImage>, FeedViewAdapter>
    // MARK: - Combine
    
    public static func feedComposedWith(feedLoader: @escaping () -> AnyPublisher<Paginated<FeedImage>, Error>,
                                        imageLoader: @escaping (URL) -> FeedImageDataLoader.Publisher,
                                        selection: @escaping (FeedImage) -> Void = { _ in } ) -> ListViewController {
        let presentationAdapter = FeedPresentationAdapter(loader: feedLoader)
        let feedController = makeFeedViewController(title: FeedPresenter.title)
        feedController.onRefresh = presentationAdapter.loadResource

        presentationAdapter.presenter = LoadResourcePresenter(resourceView: FeedViewAdapter(controller: feedController,
                                                                                            imageLoader: imageLoader,
                                                                                            selection: selection),
                                                              loadingView: WeakRefVirtualProxy(feedController),
                                                              errorView: WeakRefVirtualProxy(feedController),
                                                              mapper: { $0 } )
        return feedController
    }
    
    private static func makeFeedViewController(title: String) -> ListViewController {
        let bundle = Bundle(for: ListViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        let feedController = storyboard.instantiateInitialViewController() as! ListViewController
        feedController.title = FeedPresenter.title
        return feedController
    }
}

    // MARK: -  Pre Image Comments Generic Refactor
//    public static func feedComposedWith(feedLoader: @escaping () -> AnyPublisher<[FeedImage], Error>,
//                                        imageLoader: @escaping (URL) -> FeedImageDataLoader.Publisher) -> FeedViewController {
//        let presentationAdapter = FeedLoaderPresentationAdapter(feedLoader: feedLoader)
//        let feedController = makeFeedViewController(delegate: presentationAdapter, title: FeedPresenter.title)
//
//        presentationAdapter.presenter = FeedPresenter(feedView: FeedViewAdapter(controller: feedController,
//                                                                                imageLoader: imageLoader),
//                                                      loadingView: WeakRefVirtualProxy(feedController),
//                                                      errorView: WeakRefVirtualProxy(feedController))
//        return feedController
//    }
    
    // MARK: - Decorators
//    public static func feedComposedWith(feedLoader: FeedLoader, imageLoader: FeedImageDataLoader) -> FeedViewController {
//        let presentationAdapter = FeedLoaderPresentationAdapter(feedLoader: MainQueueDispatchDecorator(decoratee: feedLoader))
//        let feedController = makeFeedViewController(delegate: presentationAdapter,
//                                                    title: FeedPresenter.title)
//        presentationAdapter.presenter = FeedPresenter(feedView: FeedViewAdapter(controller: feedController,
//                                                                                imageLoader: MainQueueDispatchDecorator(decoratee: imageLoader)),
//                                                      loadingView: WeakRefVirtualProxy(feedController),
//                                                      errorView: WeakRefVirtualProxy(feedController))
//        return feedController
//    }
