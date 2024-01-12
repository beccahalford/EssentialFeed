//
//  SharedTestHelpers.swift
//  EssentialAppTests
//
//  Created by Rebecca Woodman-Halford on 05/01/2024.
//

import Foundation
import EssentialFeed


func anyData() -> Data {
    Data("any data".utf8)
}

func anyURL() -> URL {
    URL(string: "http://a-url.com")!
}

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 0)
}

func uniqueFeed() -> [FeedImage] {
    [FeedImage(id: UUID(), description: "any", location: "any", url: anyURL())]
}
