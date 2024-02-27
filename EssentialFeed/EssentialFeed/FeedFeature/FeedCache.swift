//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Rebecca Woodman-Halford on 08/01/2024.
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
