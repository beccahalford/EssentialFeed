//
//  ImageCommentsEndpoint.swift
//  EssentialFeed
//
//  Created by Rebecca Woodman-Halford on 02/02/2024.
//

import Foundation

public enum ImageCommentsEndpoint {
    case get(UUID)

    public func url(baseURL: URL) -> URL {
        switch self {
        case let .get(id):
            return baseURL.appendingPathComponent("/v1/image/\(id)/comments")
        }
    }
}
