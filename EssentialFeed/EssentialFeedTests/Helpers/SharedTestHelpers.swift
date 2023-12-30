//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Rebecca Woodman-Halford on 26/05/2023.
//

import Foundation

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 1)
}

func anyURL() -> URL {
    URL(string: "http://any-url.com")!
}

func anyData() -> Data {
    return Data("any data".utf8)
}
