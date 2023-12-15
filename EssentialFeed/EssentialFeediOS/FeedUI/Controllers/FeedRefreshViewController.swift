//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Rebecca Woodman-Halford on 10/12/2023.
//

import UIKit

public final class FeedRefreshViewController: NSObject {
    
    public lazy var view: UIRefreshControl = binded(UIRefreshControl())
    private let viewModel: FeedViewModel
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
    }
        
    @objc func refresh() {
        viewModel.loadFeed()
    }
    
    private func binded(_ view: UIRefreshControl) -> UIRefreshControl {
        viewModel.onLoadingStateChange = { [weak self] isLoading in
            if isLoading {
                self?.view.beginRefreshing()
            } else {
                self?.view.endRefreshing()
            }
        }
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return view
    }
}
