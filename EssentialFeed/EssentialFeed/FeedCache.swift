//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Trip Phillips on 12/18/22.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ feed: [FeedImage], completion: @escaping (FeedCache.Result) -> Void)
}
