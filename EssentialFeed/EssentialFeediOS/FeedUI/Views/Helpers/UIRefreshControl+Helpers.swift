//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Rebecca Woodman-Halford on 30/12/2023.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
