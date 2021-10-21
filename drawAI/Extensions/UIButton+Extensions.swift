//
//  UIButton+Extensions.swift
//  drawAI
//
//  Created by Leonardo Viana on 20/10/21.
//

import UIKit

extension UIButton {
    func setCircleButton() {
        setClipsToBounds()
        
        self.layer.cornerRadius = self.bounds.size.width / 2
    }
    
    private func setClipsToBounds() {
        if !self.clipsToBounds {
            self.clipsToBounds = true
        }
    }
}
