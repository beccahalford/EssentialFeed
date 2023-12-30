//
//  HTTPURLResponse.swift
//  EssentialFeed
//
//  Created by Rebecca Woodman-Halford on 30/12/2023.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }

    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
