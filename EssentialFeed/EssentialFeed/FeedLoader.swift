//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Trip Phillips on 4/12/22.
//

import Foundation

enum FeedLoaderResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (FeedLoaderResult) -> Void)
}
