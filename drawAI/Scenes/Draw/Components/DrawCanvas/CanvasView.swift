//
//  CanvasView.swift
//  drawAI
//
//  Created by João Guilherme on 21/10/21.
//

import UIKit
import PencilKit

class CanvasView: ANView {

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func setupDrawing(){
        
        let canvasView = PKCanvasView(frame: self.bounds)
        canvasView.drawingPolicy = .anyInput
        canvasView.drawing = PKDrawing()
        let toolPicker = PKToolPicker.init()
        toolPicker.setVisible(false, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
        self.addSubview(canvasView)
    }

}
