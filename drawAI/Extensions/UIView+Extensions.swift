//
//  UIView+Extensions.swift
//  drawAI
//
//  Created by Leonardo Viana on 21/10/21.
//

import UIKit

extension UIView {
    func pinEdges(to other: UIView) {
        leadingAnchor.constraint(equalTo: other.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: other.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: other.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: other.bottomAnchor).isActive = true
    }
    
    func setRounded() {
        layer.cornerRadius = frame.width/2
        layer.masksToBounds = true
        //clipsToBounds = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat, borderWidth: CGFloat?, borderColor: UIColor?) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath

        self.layer.mask = maskLayer
        self.layer.masksToBounds = true

        if (borderWidth != nil && borderColor != nil) {

            // remove previously added border layer
            for layer in layer.sublayers! {
                if layer.name == "borderLayer" {
                    layer.removeFromSuperlayer()
                }
            }

            let borderLayer = CAShapeLayer()

            borderLayer.frame = self.bounds;
            borderLayer.path  = maskPath.cgPath;
            borderLayer.lineWidth = borderWidth ?? 0;
            borderLayer.strokeColor = borderColor?.cgColor;
            borderLayer.fillColor   = UIColor.clear.cgColor;
            borderLayer.name = "borderLayer"

            self.layer.addSublayer(borderLayer);

        }
    }
}

//@IBDesignable extension UIView {
//    @IBInspectable var isRounded : Bool {
//        set {
//            let radius: CGFloat = newValue ? self.frame.height/2 : self.layer.cornerRadius
//            self.layer.cornerRadius = radius
//            self.layer.masksToBounds = true
//        }
//        get {
//            return self.isRounded
//        }
//    }
//}
