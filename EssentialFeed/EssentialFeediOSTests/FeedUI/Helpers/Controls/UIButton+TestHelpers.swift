//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Rebecca Woodman-Halford on 10/12/2023.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}

