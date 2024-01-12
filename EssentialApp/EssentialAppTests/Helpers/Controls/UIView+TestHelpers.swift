//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Rebecca Woodman-Halford on 12/01/2024.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
