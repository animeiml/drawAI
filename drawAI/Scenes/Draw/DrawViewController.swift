//
//  DrawViewController.swift
//  drawAI
//
//  Created by João Guilherme on 20/10/21.
//

import UIKit
import Foundation

class DrawViewController: UIViewController {
    @IBOutlet weak var canvasView: CanvasView!
    @IBOutlet weak var toolsView: DrawToolsView!
    @IBOutlet weak var timerBarView: DrawTimerBarView!
    
    private var viewModel: DrawViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toolsView.delegate = self
        timerBarView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        canvasView.setupDrawing()
        timerBarView.startTimer()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(viewModel: DrawViewModel = DrawViewModel()) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
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
extension DrawViewController: DrawTimerBarDelegate {
    func didFinishTime() {
        guard let drawing: UIImage = canvasView.captureDrawImage(),
              let drawingData: Data = drawing.pngData() else { return }
        
        viewModel.saveImageWithData(drawingData)
        
        // TODO: push next view and rank drawing similarity
    }
}
