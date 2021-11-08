//
//  DrawViewController.swift
//  drawAI
//
//  Created by João Guilherme on 20/10/21.
//

import UIKit
import Foundation

class DrawViewController: UIViewController {
    @IBOutlet weak var referenceImageImageView: UIImageView!
    @IBOutlet weak var canvasView: CanvasView!
    @IBOutlet weak var toolsView: DrawToolsView!
    @IBOutlet weak var timerBarView: DrawTimerBarView!
    
    private var viewModel: DrawViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        
        toolsView.delegate = self
        timerBarView.delegate = self
        
        setupUI()
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

extension DrawViewController {
    func setupUI() {
        view.backgroundColor = AppColors.backgroundColor
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
              let drawingData: Data = drawing.pngData(),
              let reference: UIImage = UIImage(named: "espadinha"),
              let referenceData: Data = reference.pngData() else { return }
        
        viewModel.saveDrawingImgURL(drawingData)
        viewModel.saveReferenceImgURL(referenceData)
                
        let finishedVC: FinishedViewController = FinishedViewController()
        
        navigationController?.pushViewController(finishedVC, animated: true)
    }
}
