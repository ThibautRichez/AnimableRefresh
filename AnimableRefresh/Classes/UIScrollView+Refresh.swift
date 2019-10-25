//
//  UIScrollView+Refresh.swift
//  Refresh
//
//  Created by Thibaut Richez on 10/19/19.
//  Copyright © 2019 Thibaut Richez. All rights reserved.
//

import UIKit

extension UIScrollView {
    /// The custom `RefreshView` associated to the `scrollView`
    /// - Note: You must call `addRefresh(custom:action:)` before using this value
    public var refreshView: RefreshView? {
        return subviews.first { $0 is RefreshView } as? RefreshView
    }

    /// Add a pull to refresh effect to a `UIScrollView` or any of its subclasses (`UITableView` -
    /// `UICollectionView`).
    ///- Parameters:
    ///    - custom: The view that you want to be animated during the `action` process.
    ///    If not provided, a system like view is shown (`SystemLoaderView`)
    ///    - action: The action you want to be triggered on loading process
    public func addRefresh(custom view: RefreshAnimableView = SystemLoaderView(), action: (() -> Void)?) {
        let refresherView = RefreshView(animableView: view, action: action)
        refresherView.scrollView = self
        addSubview(refresherView)
        sendSubviewToBack(refresherView)
    }

    /// Tells the view that the refresh operation was started programmatically.
    /// - Note: You must call `addRefresh(custom:action:)` before calling this method
    public func startRefresh() {
        refreshView?.startRefresh()
    }

    /// Tells the view that the refresh operation has ended.
    /// - Note: You must call `addRefresh(custom:action:)` before calling this method
    public func endRefresh() {
        refreshView?.endRefresh()
    }
}
