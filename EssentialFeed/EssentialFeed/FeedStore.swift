//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by Trip Phillips on 5/18/22.
//

import Foundation

public typealias CachedFeed = (feed: [LocalFeedImage], timestamp: Date) 

public protocol FeedStore {
    typealias DeletionResult = Error?
    typealias DeletionCompletion = (DeletionResult) -> ()
    
    typealias InsertionResult = Error?
    typealias InsertionCompletion = (InsertionResult) -> ()
    
    typealias RetrievalResult = Result<CachedFeed?, Error>
    typealias RetrievalCompletion = (RetrievalResult) -> ()

    /// The completion handler can be invoked in any thread.
    /// Clients are responsible to dispatch to appropriate threads, if needed.
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    
    /// The completion handler can be invoked in any thread.
    /// Clients are responsible to dispatch to appropriate threads, if needed.
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion)
    
    /// The completion handler can be invoked in any thread.
    /// Clients are responsible to dispatch to appropriate threads, if needed.
    func retrieve(completion: @escaping RetrievalCompletion)
}
