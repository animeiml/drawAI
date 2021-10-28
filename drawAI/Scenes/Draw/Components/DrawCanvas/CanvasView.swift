//
//  CanvasView.swift
//  drawAI
//
//  Created by João Guilherme on 21/10/21.
//

import UIKit
import PencilKit

class CanvasView: ANView {
    private var canvasView: PKCanvasView?
    
    private let pencilTool: PKInkingTool = PKInkingTool(.pencil, color: .black)
    private let eraserTool: PKEraserTool = PKEraserTool(.bitmap)
    
    enum CanvasTool {
        case pencil
        case eraser
    }
    
    override func awakeFromNib() {
        canvasView = PKCanvasView(frame: self.bounds)
    }
}

extension CanvasView {
    func setupDrawing(){
        guard let canvasView: PKCanvasView = canvasView else { return }
        
        canvasView.drawingPolicy = .anyInput
        canvasView.backgroundColor = Colors.backgroundColor
        canvasView.drawing = PKDrawing()
                
        self.addSubview(canvasView)
    }

    func chooseTool(_ newTool: CanvasTool) {
        let selectedTool: PKTool
        
        switch newTool {
        case .pencil:
            selectedTool = pencilTool
        case .eraser:
            selectedTool = eraserTool
        }
        
        canvasView?.tool = selectedTool
    }
    
    func captureDrawImage() -> UIImage? {
        guard let canvas: PKCanvasView = canvasView else { return nil }
        
        let image: UIImage = canvas.drawing.image(from: canvas.drawing.bounds, scale: 1)
        
        return image
    }
}
