//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Rebecca Woodman-Halford on 10/12/2023.
//

import Foundation

public protocol FeedImageDataLoaderTask {
    func cancel()
}

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
