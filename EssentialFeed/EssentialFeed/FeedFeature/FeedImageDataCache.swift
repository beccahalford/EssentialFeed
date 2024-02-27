//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by Rebecca Woodman-Halford on 08/01/2024.
//

import Foundation

public protocol FeedImageDataCache {
    func save(_ data: Data, for url: URL) throws
}
