//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Trip Phillips on 12/10/22.
//

import Foundation

public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
