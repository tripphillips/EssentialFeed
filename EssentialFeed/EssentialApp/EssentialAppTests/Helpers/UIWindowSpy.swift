//
//  UIWindowSpy.swift
//  EssentialAppTests
//
//  Created by Trip Phillips on 12/31/22.
//

import UIKit

class UIWindowSpy: UIWindow {
  var makeKeyAndVisibleCallCount = 0
  override func makeKeyAndVisible() {
    makeKeyAndVisibleCallCount = 1
  }
}
