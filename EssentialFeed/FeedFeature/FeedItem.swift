//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Rebecca Woodman-Halford on 05/02/2023.
//

import Foundation

struct FeedItem {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}