//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by Trip Phillips on 12/18/22.
//

import Foundation

public protocol FeedImageDataCache {
    func save(_ data: Data, for url: URL) throws
}
