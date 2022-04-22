//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Trip Phillips on 4/21/22.
//

import Foundation

internal final class FeedItemsMapper {
    
    private enum Constants {
        static let okStatusCode: Int = 200
    }
    
    private struct Root: Decodable {
        let items: [Item]
    }

    private struct Item: Decodable {
        let id: UUID
        let description: String?
        let location: String?
        let image: URL
        
        var item: FeedItem {
            return FeedItem(id: id,
                            description: description,
                            location: location,
                            imageURL: image)
        }
    }
    
    static let decoder = JSONDecoder()
    
    internal static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [FeedItem] {
        guard response.statusCode == Constants.okStatusCode else {
            throw RemoteFeedLoader.Error.invalidData
        }
        
        let root = try decoder.decode(Root.self, from: data)
        return root.items.map { $0.item }
    }
}
