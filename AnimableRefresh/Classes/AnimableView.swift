//
//  AnimableView.swift
//  Refresh
//
//  Created by Thibaut Richez on 10/20/19.
//  Copyright © 2019 Thibaut Richez. All rights reserved.
//

import UIKit

public protocol AnimableView: UIView {
    func animate()
    func stopAnimating()
}

public protocol RefreshAnimableView: AnimableView {
    /// When initializing a `RefreshView` with a custom`RefreshAnimableView`, it will use this method to notify this view that the user
    /// is pulling the associated scrollView down
    /// - Parameter position: value between 0 and 1 (0 being the initial position, 1 being when the `RefreshView` is fully visible)
    func animatePullingPosition(_ position: CGFloat)
}
