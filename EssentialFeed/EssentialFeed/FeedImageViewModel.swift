//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Trip Phillips on 12/5/22.
//

import Foundation

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
  
    public var hasLocation: Bool {
        return location != nil
    }
}
