//
//  ListViewController.swift
//  EssentialFeediOS
//
//  Created by Rebecca Woodman-Halford on 26/01/2024.
//

import UIKit
import EssentialFeed

public final class ListViewController: UITableViewController, UITableViewDataSourcePrefetching, ResourceLoadingView, ResourceErrorView {
    
    private(set) public var errorView = ErrorView()
    
//    private var loadingControllers = [IndexPath: CellController]()
    private var onViewIsAppearing: ((ListViewController) -> Void)?
    public var onRefresh: (() -> Void)?
    
//    private var tableModel = [CellController]() {
//        didSet { tableView.reloadData() }
//    }
    
    private lazy var dataSource: UITableViewDiffableDataSource<Int, CellController> = {
        .init(tableView: tableView) { (tableView, index, controller) -> UITableViewCell? in
            controller.dataSource.tableView(tableView, cellForRowAt: index)
        }
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        onViewIsAppearing = { vc in
            vc.refreshControl?.beginRefreshing()
            vc.onViewIsAppearing = nil
        }
        
        configureTableView()
        configureTraitCollectionObservers()
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
        onRefresh?()
    }
    
    func configureTableView() {
        dataSource.defaultRowAnimation = .fade
        tableView.dataSource = dataSource
        tableView.tableHeaderView = errorView.makeContainer()
    }
        
    private func configureTraitCollectionObservers() {
        registerForTraitChanges(
            [UITraitPreferredContentSizeCategory.self]
        ) { (self: Self, previous: UITraitCollection) in
            self.tableView.reloadData()
        }
    }
    
    public func display(_ sections: [CellController]...) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, CellController>()
        sections.enumerated().forEach { section, cellControllers in
            snapshot.appendSections([section])
            snapshot.appendItems(cellControllers, toSection: section)
        }
        
        if #available(iOS 15.0, *) {
            dataSource.applySnapshotUsingReloadData(snapshot)
        } else {
            dataSource.apply(snapshot)
        }
    }
    
    public func display(_ viewModel: ResourceLoadingViewModel) {
        refreshControl?.update(isRefreshing: viewModel.isLoading)
    }

    public func display(_ viewModel: ResourceErrorViewModel) {
        errorView.message = viewModel.message
    }

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dl = cellController(at: indexPath)?.delegate
        dl?.tableView?(tableView, didSelectRowAt: indexPath)
    }
    
    public override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let delegate = cellController(at: indexPath)?.delegate
        delegate?.tableView?(tableView, didEndDisplaying: cell, forRowAt: indexPath)
    }
    
    public override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let delegate = cellController(at: indexPath)?.delegate
        delegate?.tableView?(tableView, willDisplay: cell, forRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        indexPaths.forEach { indexPath in
            let dsPrefetching = cellController(at: indexPath)?.dataSourcePrefetching
            dsPrefetching?.tableView(tableView, prefetchRowsAt: [indexPath])
        }
    }
    
    public func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        indexPaths.forEach { indexPath in
            let dsPrefetching = cellController(at: indexPath)?.dataSourcePrefetching
            dsPrefetching?.tableView?(tableView, cancelPrefetchingForRowsAt: [indexPath])
        }
    }

    private func cellController(at indexPath: IndexPath) -> CellController? {
        dataSource.itemIdentifier(for: indexPath)
    }
}
