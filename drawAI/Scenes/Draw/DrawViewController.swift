//
//  DrawViewController.swift
//  drawAI
//
//  Created by João Guilherme on 20/10/21.
//

import UIKit

class DrawViewController: UIViewController {
    @IBOutlet weak var canvasView: CanvasView!
    @IBOutlet weak var toolsView: DrawToolsView!
    @IBOutlet weak var timerBarView: DrawTimerBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toolsView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        canvasView.setupDrawing()
        timerBarView.startTimer(progressBar: timerBarView)
    }
}

extension DrawViewController: DrawToolsDelegate {
    func onPencilChosen() {
        canvasView.chooseTool(.pencil)
    }
    
    func onEraserChosen() {
        canvasView.chooseTool(.eraser)
    }
}
