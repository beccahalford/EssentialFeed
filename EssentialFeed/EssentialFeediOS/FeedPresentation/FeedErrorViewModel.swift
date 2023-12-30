//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Rebecca Woodman-Halford on 30/12/2023.
//

import Foundation

struct FeedErrorViewModel {
    let message: String?

    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }

    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
