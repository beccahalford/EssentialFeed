//
//  FeedViewModel.swift
//  EssentialFeediOS
//
//  Created by Rebecca Woodman-Halford on 15/12/2023.
//

import EssentialFeed

//final class LegacyFeedViewModel {
//    typealias Observer<T> = (T) -> Void
//    
//    private let feedLoader: FeedLoader
//    var onLoadingStateChange: Observer<Bool>?
//    var onFeedLoad: Observer<[FeedImage]>?
//    
//    init(feedLoader: FeedLoader) {
//        self.feedLoader = feedLoader
//    }
//    
//    func loadFeed() {
//        onLoadingStateChange?(true)
//        feedLoader.load { [weak self] result in
//            if let feed = try? result.get() {
//                self?.onFeedLoad?(feed)
//            }
//            self?.onLoadingStateChange?(false)
//        }
//    }
//}
