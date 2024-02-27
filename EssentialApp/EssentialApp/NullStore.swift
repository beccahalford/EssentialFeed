//
//  NullStore.swift
//  EssentialApp
//
//  Created by Rebecca Woodman-Halford on 19/02/2024.
//

import Foundation
import EssentialFeed

class NullStore: FeedStore {
    func deleteCachedFeed() throws {}

    func insert(_ feed: [LocalFeedImage], timestamp: Date) throws {}

    func retrieve() throws -> CachedFeed? { .none }
}

extension NullStore: FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws {}

    func retrieve(dataForURL url: URL) throws -> Data? { .none }
}
