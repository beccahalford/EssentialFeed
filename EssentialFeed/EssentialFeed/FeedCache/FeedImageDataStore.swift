//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Rebecca Woodman-Halford on 30/12/2023.
//

import Foundation

public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
