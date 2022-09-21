//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Trip Phillips on 4/21/22.
//

import Foundation

final class FeedItemsMapper {
    
    private enum Constants {
        static let okStatusCode: Int = 200
    }
    
    private struct Root: Decodable {
        let items: [RemoteFeedItem]
    }
    
    static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RemoteFeedItem] {
        guard response.statusCode == Constants.okStatusCode,
              let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw RemoteFeedLoader.Error.invalidData
        }
        
        return root.items
    }
}
