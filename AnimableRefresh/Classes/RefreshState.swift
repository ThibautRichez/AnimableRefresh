//
//  RefreshState.swift
//  Refresh
//
//  Created by Thibaut Richez on 10/20/19.
//  Copyright © 2019 Thibaut Richez. All rights reserved.
//

import UIKit

/// Define the different states in which a `RefreshView` can be
enum RefreshState: Equatable {
    case inactive
    /// The `RefreshView` is animating the loading process
    case loading
    /// The user is pulling down the `scrollView`. The position is set relatively to how mutch
    /// the user pulled down the associated `scrollView`
    case pulling(position: CGFloat)
    /// The `RefreshView` finished its loading animation.
    case finished

    static public func ==(from: RefreshState, to: RefreshState) -> Bool {
        switch (from, to) {
        case (.inactive, .inactive): return true
        case (.loading, .loading): return true
        case (.finished, .finished): return true
        case (let .pulling(fromPosition), let .pulling(toPosition)):
            // We accept the equality even if `fromPosition` is superior to `toPosition`
            // giving a better effect when comparing the state to know if we should start the
            // loading process
            return round(fromPosition) >= round(toPosition)
        default: return false
        }
    }
}
