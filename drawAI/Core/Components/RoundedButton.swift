//
//  RoundedButton.swift
//  drawAI
//
//  Created by Leonardo Viana on 10/11/21.
//
//  Ref: https://stackoverflow.com/questions/47515848/swift-button-round-corner-breaks-contraints

import UIKit

class RoundedButton: UIButton {
    var borderWidth = CGFloat(0.0)
    var borderColor: UIColor?

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let radius: CGFloat = self.frame.height / 2
        let corners: UIRectCorner = .allCorners

        // don't apply mask if corners is not set, or if radius is Zero
        guard radius > 0.0 else {
            return
        }

        roundCorners(corners: corners, radius: radius, borderWidth: borderWidth, borderColor: borderColor)
    }
}
