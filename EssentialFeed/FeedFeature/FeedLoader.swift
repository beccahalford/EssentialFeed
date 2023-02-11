//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Rebecca Woodman-Halford on 05/02/2023.
//

import Foundation

public enum LoadFeedResult<Error: Swift.Error> {
    case success([FeedItem])
    case failure(Error)
}


extension LoadFeedResult: Equatable where Error: Equatable{}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
