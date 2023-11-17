//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Rebecca Woodman-Halford on 05/02/2023.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    
    func load(completion: @escaping (Result) -> Void)
}


