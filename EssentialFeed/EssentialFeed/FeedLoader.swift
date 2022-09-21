//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Trip Phillips on 4/12/22.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    
    func load(completion: @escaping (Result) -> Void)
}
