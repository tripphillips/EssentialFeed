//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Trip Phillips on 12/21/22.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
