//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by Rebecca Woodman-Halford on 08/01/2024.
//

import Foundation

public protocol FeedImageDataCache {
    typealias Result = Swift.Result<Void, Error>

    func save(_ data: Data, for url: URL, completion: @escaping (Result) -> Void)
}
