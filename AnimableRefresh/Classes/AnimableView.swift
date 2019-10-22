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
