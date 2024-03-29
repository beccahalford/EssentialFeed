//
//  FeedLoaderPresentationAdapter.swift
//  EssentialFeediOS
//
//  Created by Rebecca Woodman-Halford on 29/12/2023.
//

import Combine
import EssentialFeed
import EssentialFeediOS

final class FeedLoaderPresentationAdapter {
    private let feedLoader: () -> AnyPublisher<[FeedImage], Error>
    private var cancellable: Cancellable?
    var presenter: LoadResourcePresenter<[FeedImage], FeedViewAdapter>?
    
    init(feedLoader: @escaping () -> AnyPublisher<[FeedImage], Error>) {
        self.feedLoader = feedLoader
    }
    
    func didRequestFeedRefresh() {
        presenter?.didStartLoading()
        
        cancellable = feedLoader()
            .dispatchOnMainQueue()
            .sink(
                receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .finished: break

                    case let .failure(error):
                        self?.presenter?.didFinishLoading(with: error)
                    }
                }, receiveValue: { [weak self] feed in
                    self?.presenter?.didFinishLoading(with: feed)
                })
        
//        feedLoader.load { [weak self] result in
//            switch result {
//            case let .success(feed):
//                self?.presenter?.didFinishLoadingFeed(with: feed)
//            case let .failure(error):
//                self?.presenter?.didFinishLoadingFeed(with: error)
//            }
//        }
    }
}
