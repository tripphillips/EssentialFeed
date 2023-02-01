//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Trip Phillips on 11/19/22.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
