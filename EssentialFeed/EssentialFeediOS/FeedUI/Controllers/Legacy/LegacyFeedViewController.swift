//
//  FeedViewController.swift
//  EssentialFeediOS
//
//  Created by Rebecca Woodman-Halford on 08/12/2023.
//

import EssentialFeed
import UIKit
//
//public protocol FeedViewControllerDelegate {
//    func didRequestFeedRefresh()
//}

/*
 public final class FeedViewController: UITableViewController, UITableViewDataSourcePrefetching, ResourceLoadingView, ResourceErrorView {
     @IBOutlet private(set) public var errorView: ErrorView?
     private var loadingControllers = [IndexPath: FeedImageCellController]()
     private var onViewIsAppearing: ((FeedViewController) -> Void)?
     public var delegate: FeedViewControllerDelegate?
     
     private var tableModel = [FeedImageCellController]() {
         didSet { tableView.reloadData() }
     }
         
     public override func viewDidLoad() {
         super.viewDidLoad()
         
         onViewIsAppearing = { vc in
             vc.refreshControl?.beginRefreshing()
             vc.onViewIsAppearing = nil
         }
         
         refresh()
     }

     override public func viewIsAppearing(_ animated: Bool) {
         super.viewIsAppearing(animated)

         onViewIsAppearing?(self)
     }
     
     public override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()

         tableView.sizeTableHeaderToFit()
     }
     
     @IBAction private func refresh() {
         delegate?.didRequestFeedRefresh()
     }
     
     public func display(_ cellControllers: [FeedImageCellController]) {
         loadingControllers = [:]
         tableModel = cellControllers
     }
     
     public func display(_ viewModel: ResourceLoadingViewModel) {
         refreshControl?.update(isRefreshing: viewModel.isLoading)
     }

     public func display(_ viewModel: ResourceErrorViewModel) {
         errorView?.message = viewModel.message
     }
     
     public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         tableModel.count
     }
     
     public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         return cellController(forRowAt: indexPath).view(in: tableView)
     }
     
     public override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
         cancelCellControllerLoad(forRowAt: indexPath)
     }
     
     public override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
         cellController(forRowAt: indexPath).preload()
     }
     
     public func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
         indexPaths.forEach { indexPath in
             cellController(forRowAt: indexPath).preload()
         }
     }
     
     public func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
         indexPaths.forEach(cancelCellControllerLoad)
     }

     private func cellController(forRowAt indexPath: IndexPath) -> FeedImageCellController {
         let controller = tableModel[indexPath.row]
         loadingControllers[indexPath] = controller
         return controller
     }
     
     private func cancelCellControllerLoad(forRowAt indexPath: IndexPath) {
         loadingControllers[indexPath]?.cancelLoad()
         loadingControllers[indexPath] = nil
     }
 }

 */
