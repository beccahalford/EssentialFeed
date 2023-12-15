//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Rebecca Woodman-Halford on 10/12/2023.
//

import EssentialFeed
import Foundation

public final class FeedUIComposer {
    private init() {}
    
    public static func feedComposedWith(feedLoader: FeedLoader, imageLoader: FeedImageDataLoader) -> FeedViewController {
        let feedViewModel = FeedViewModel(feedLoader: feedLoader)
        let refreshController = FeedRefreshViewController(viewModel: feedViewModel)
        let feedController = FeedViewController(refreshController: refreshController)

        feedViewModel.onFeedLoad = adaptFeedToCellControllers(fowardingTo: feedController, loader: imageLoader)
        return feedController
    }
    
    // [FeedImage] -> Adapt -> [FeedImageCellController]
    
    private static func adaptFeedToCellControllers(fowardingTo controller: FeedViewController, loader: FeedImageDataLoader) -> ([FeedImage]) -> Void {
        return { [weak controller] feed in
            controller?.tableModel = feed.map { model in
                FeedImageCellController(model: model, imageLoader: loader)
            }
        }
    }
}