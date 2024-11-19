//
//  UIView+Extensions.swift
//  SwiftExtensions
//

import UIKit

public extension UIView {
    func cornerRadius(corners: UIRectCorner, _ radii: CGSize) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: radii)
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
    }
    
    func cornerRadius(corners: CACornerMask, _ radius: CGFloat) {
        layer.cornerRadius = 10
        layer.maskedCorners = corners
    }
}
