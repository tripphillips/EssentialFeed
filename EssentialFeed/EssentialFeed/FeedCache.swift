//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Trip Phillips on 12/18/22.
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
