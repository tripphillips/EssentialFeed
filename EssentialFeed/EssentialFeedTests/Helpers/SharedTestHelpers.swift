//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Trip Phillips on 5/27/22.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func anyData() -> Data {
    Data("any data".utf8)
}
