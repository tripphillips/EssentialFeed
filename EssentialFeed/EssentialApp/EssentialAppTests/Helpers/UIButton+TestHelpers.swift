//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Trip Phillips on 11/27/22.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
