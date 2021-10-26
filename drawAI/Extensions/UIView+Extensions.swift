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
}

@IBDesignable extension UIView {
    @IBInspectable var isRounded : Bool {
        set {
            let radius: CGFloat = newValue ? self.frame.height/2 : self.layer.cornerRadius
            self.layer.cornerRadius = radius
            self.layer.masksToBounds = true
        }
        get {
            return self.isRounded
        }
    }
}
