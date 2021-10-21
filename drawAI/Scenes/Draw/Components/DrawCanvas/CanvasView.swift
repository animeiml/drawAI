//
//  CanvasView.swift
//  drawAI
//
//  Created by João Guilherme on 20/10/21.
//

import UIKit
import PencilKit

class CanvasView: UIView {
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func setupDrawing(){
        
        let canvasView = PKCanvasView(frame: self.bounds)
        let toolPicker = PKToolPicker.init()
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
        self.addSubview(canvasView)
    }

}
