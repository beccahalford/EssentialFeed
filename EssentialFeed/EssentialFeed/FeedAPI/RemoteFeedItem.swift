//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Rebecca Woodman-Halford on 28/04/2023.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
