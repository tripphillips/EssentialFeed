//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Trip Phillips on 4/12/22.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageUrl: URL
}
