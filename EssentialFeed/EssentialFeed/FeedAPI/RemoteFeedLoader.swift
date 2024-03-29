//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Rebecca Woodman-Halford on 08/02/2023.
//

import Foundation

public typealias RemoteFeedLoader = RemoteLoader<[FeedImage]>

public extension RemoteFeedLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: FeedItemsMapper.map)
    }
}

//public final class RemoteFeedLoader: FeedLoader {
//    public enum Error: Swift.Error {
//        case connectivity
//        case invalidData
//    }
//    
//    public typealias Result = FeedLoader.Result
//    
//    private let url: URL
//    private let client: HTTPClient
//    
//    public init(url: URL, client: HTTPClient) {
//        self.url = url
//        self.client = client
//    }
//    
//    public func load(completion: @escaping (Result) -> Void) {
//        client.get(from: url) { [weak self] result in
//            guard self != nil else { return }
//
//            switch result {
//            case let .success(data, response):
//                completion(RemoteFeedLoader.map(data, from: response))
//            case .failure:
//                completion(.failure(Error.connectivity))
//            }
//        }
//    }
//    
//    private static func map(_ data: Data, from response: HTTPURLResponse) -> Result {
//        do {
//            let items = try FeedItemsMapper.map(data, from: response)
//            return .success(items)
////            return .success(items.toModels())
//        } catch {
//            return .failure(error)
//        }
//    }
//}

//private extension Array where Element == RemoteFeedItem {
//    func toModels() -> [FeedImage] {
//        return map { FeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.image) }
//    }
//}
