//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Rebecca Woodman-Halford on 05/02/2023.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
