//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Trip Phillips on 5/18/22.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
