//
//  FeedLocalizationTests.swift
//  EssentialFeediOSTests
//
//  Created by Trip Phillips on 11/28/22.
//

import XCTest
import EssentialFeed

final class FeedLocalizationTests: XCTestCase {
    
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Feed"
        let presentationBundle = Bundle(for: FeedPresenter.self)
        
        assertLocalizedKeyAndValuesExist(in: presentationBundle, table)
    }
}
