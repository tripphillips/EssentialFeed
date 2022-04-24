//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Trip Phillips on 4/12/22.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
