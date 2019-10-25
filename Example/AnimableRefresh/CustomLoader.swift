//
//  NIMRefreshView.swift
//  AnimableRefresh_Example
//
//  Created by RICHEZ Thibaut on 10/25/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import AnimableRefresh
import UIKit

final class CustomLoader: UIView {
    // MARK: - Interface Properties

    private lazy var circularPath: UIBezierPath = {
        return UIBezierPath(arcCenter: .zero,
                            radius: 10,
                            startAngle: 0,
                            endAngle: 2 * CGFloat.pi,
                            clockwise: true)
    }()

    private lazy var progressLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.path = circularPath.cgPath
        layer.strokeColor = UIColor.blue.cgColor
        layer.lineWidth = 3
        layer.lineCap = .round
        layer.fillColor = UIColor.clear.cgColor
        layer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        return  layer
    }()

    private lazy var progressAnimation: CAAnimationGroup = {
        let group = CAAnimationGroup()
        group.duration = 1
        group.repeatCount = .infinity
        group.animations = [drawAnimation, clearAnimation]
        return group
    }()

    private lazy var drawAnimation: CABasicAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = self.drawDuration
        animation.repeatCount = 1
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        return animation
    }()

    private lazy var clearAnimation: CABasicAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.beginTime = self.drawDuration
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 0.5
        animation.repeatCount = 1
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        return animation
    }()

    // MARK: - Properties

    var drawDuration: CFTimeInterval = 0.5
    private let kCAProgress = "progress-animation"

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle

    override func layoutSubviews() {
        super.layoutSubviews()

        self.progressLayer.position = center
    }

    // MARK: - Configuration

    private func configure() {
        self.layer.addSublayer(progressLayer)
        self.progressLayer.isHidden = true
    }
}

// MARK: - AnimableView

extension CustomLoader: RefreshAnimableView {
    func animate() {
        self.progressLayer.strokeStart = 0
        self.progressLayer.strokeEnd = 1
        self.progressLayer.isHidden = false
        self.progressLayer.add(progressAnimation, forKey: kCAProgress)
    }

    func animatePullingPosition(_ position: CGFloat) {
        self.progressLayer.isHidden = false
        self.progressLayer.strokeEnd = position
    }

    func stopAnimating() {
        self.progressLayer.removeAnimation(forKey: kCAProgress)
        self.progressLayer.strokeStart = 0
        self.progressLayer.strokeEnd = 1
        self.progressLayer.isHidden = true
    }
}
