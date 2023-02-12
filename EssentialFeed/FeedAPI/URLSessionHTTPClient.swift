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
    
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {
        session.dataTask(with: url) { _, _, error in
            if let error {
                completion(.failure(error))
            }
        }.resume()
    }
}
