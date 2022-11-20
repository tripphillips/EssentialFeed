//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Trip Phillips on 11/19/22.
//

import UIKit
import EssentialFeed

final class FeedRefreshViewController: NSObject {
    
    private(set) lazy var view: UIRefreshControl = {
        $0.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return $0
    }(UIRefreshControl())
    
    private let feedLoader: FeedLoader
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    var onRefresh: (([FeedImage]) -> Void)?
    
    @objc func refresh() {
        view.beginRefreshing()
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.onRefresh?(feed)
            }
            self?.view.endRefreshing()
        }
    }
}
