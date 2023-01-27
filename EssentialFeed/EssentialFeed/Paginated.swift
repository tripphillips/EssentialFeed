//
//  Paginated.swift
//  EssentialFeed
//
//  Created by Trip Phillips on 1/27/23.
//

import Foundation

public struct Paginated<Item> {
    public typealias LoadMoreCompletion = (Result<Paginated<Item>, Error>) -> Void
   
    public let items: [Item]
    public let loadMore: ((@escaping LoadMoreCompletion) -> Void)?
    
    public init(items: [Item], loadMore: ((@escaping LoadMoreCompletion) -> Void)? = nil) {
        self.items = items
        self.loadMore = loadMore
    }
}
