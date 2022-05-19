//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by Trip Phillips on 5/18/22.
//

import Foundation

public protocol FeedStore {
    typealias DeletionCompletion = (Error?) -> ()
    typealias InsertionCompletion = (Error?) -> ()
    
    func deleteCacheFeed(completion: @escaping DeletionCompletion)
    func insert(_ items: [LocalFeedItem], timestamp: Date, completion: @escaping InsertionCompletion)
}
