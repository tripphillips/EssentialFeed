//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Trip Phillips on 12/4/22.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
