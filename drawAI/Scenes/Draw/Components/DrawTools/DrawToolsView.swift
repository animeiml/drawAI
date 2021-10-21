//
//  DrawToolsView.swift
//  drawAI
//
//  Created by Leonardo Viana on 20/10/21.
//

import Foundation
import UIKit

class DrawToolsView: UIView {
    @IBOutlet weak var pencilButton: UIButton!
    @IBOutlet weak var eraserButton: UIButton!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        setupButtons()
    }
    
    private func setupButtons() {
//        pencilButton.setCircleButton()
//        eraserButton.setCircleButton()
    }
}
