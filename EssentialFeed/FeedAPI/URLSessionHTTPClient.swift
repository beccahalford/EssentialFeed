//
//  URLSessionHTTPClient.swift
//  EssentialFeed
//
//  Created by Rebecca Woodman-Halford on 11/02/2023.
//

import Foundation

class URLSessionHTTPClient {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func get(from url: URL) {
        session.dataTask(with: url) { _, _, _ in
            
        }
    }
}
