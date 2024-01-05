//
//  SharedTestHelpers.swift
//  EssentialAppTests
//
//  Created by Rebecca Woodman-Halford on 05/01/2024.
//

import Foundation


func anyData() -> Data {
    return Data("any data".utf8)
}

func anyURL() -> URL {
    return URL(string: "http://a-url.com")!
}

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}
