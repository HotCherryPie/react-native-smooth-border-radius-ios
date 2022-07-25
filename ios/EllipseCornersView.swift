// https://stackoverflow.com/questions/36423661/ios-is-possible-to-rounder-radius-with-different-value-in-each-corner
// https://twitter.com/nathangitter/status/992842150500069376
// https://stackoverflow.com/questions/52310339/smooth-rounded-corners-in-swift

import Foundation
import UIKit

@IBDesignable
class EllipseCornersView : UIView {

    var radius: CGFloat = 20

    var tile: NSString = "none"

    let containerView = UIView()

    let maskLayer = CAShapeLayer()

    static let tileConfigs : [NSString: UIRectCorner] = [
        "none": [.topRight, .topLeft, .bottomRight, .bottomLeft],
        "all": [],
        "left": [.topRight, .bottomRight],
        "right": [.topLeft, .bottomLeft],
        "top": [.bottomLeft, .bottomRight],
        "bottom": [.topLeft, .topRight],
    ]

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(containerView)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let roundPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: EllipseCornersView.tileConfigs[tile]!,
            cornerRadii: CGSize(width: radius, height: radius))

        maskLayer.path = roundPath.cgPath
        layer.mask = maskLayer
    }

    @objc public func setRadius(_ radius: CGFloat) {
        self.radius = radius
    }

    @objc public func setTile(_ tile: NSString) {
        self.tile = tile
    }
}


@objc(EllipseCornersViewManager)
class EllipseCornersViewManager: RCTViewManager {
    override func view() -> UIView! {
        let ellipseCorners = EllipseCornersView()
        return ellipseCorners
    }

    override static func requiresMainQueueSetup() -> Bool {
        return true
    }
}
