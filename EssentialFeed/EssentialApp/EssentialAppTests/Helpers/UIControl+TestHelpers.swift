//
//  UIControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Trip Phillips on 11/27/22.
//

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
