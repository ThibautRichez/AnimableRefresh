//
//  ClassicLoaderView.swift
//  Refresh
//
//  Created by Thibaut Richez on 10/19/19.
//  Copyright © 2019 Thibaut Richez. All rights reserved.
//

import UIKit

public final class SystemLoaderView: UIView {
    // MARK: - Interface Properties
    lazy var indicatorView: UIActivityIndicatorView = {
        let indicatorView: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            indicatorView = UIActivityIndicatorView(style: .large)
            indicatorView.color = .darkGray
        } else {
            indicatorView = UIActivityIndicatorView(style: .gray)
        }
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.hidesWhenStopped = true
        return indicatorView
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func configure() {
        addSubview(indicatorView)
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: indicatorView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: indicatorView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        ])
    }
}

// MARK: - AnimableView

extension SystemLoaderView: AnimableView {
    public func animate() {
        indicatorView.startAnimating()
    }

    public func stopAnimating() {
        indicatorView.stopAnimating()
    }
}
