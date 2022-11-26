//
//  UITableView+Dequeuing.swift
//  EssentialFeediOS
//
//  Created by Trip Phillips on 11/26/22.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
