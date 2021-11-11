//
//  DrawViewController.swift
//  drawAI
//
//  Created by João Guilherme on 20/10/21.
//

import UIKit
import Foundation

class DrawViewController: UIViewController {
    @IBOutlet private weak var referenceImageImageView: UIImageView!
    @IBOutlet private weak var canvasView: CanvasView!
    @IBOutlet private weak var toolsView: DrawToolsView!
    @IBOutlet private weak var timerBarView: DrawTimerBarView!
    @IBOutlet private weak var separatorView: UIView!
    
    private var viewModel: DrawViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        
        toolsView.delegate = self
        timerBarView.delegate = self
        
        toolsView.setup()
        
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
        
        referenceImageImageView.layer.cornerRadius = canvasView.frame.height * 0.0549
        referenceImageImageView.layer.borderWidth = 1
        referenceImageImageView.layer.borderColor = AppColors.primaryColor.cgColor
        referenceImageImageView.backgroundColor = AppColors.backgroundColor
        referenceImageImageView.image = viewModel.randomReferenceImg
        referenceImageImageView.grayscaleImage()
        
        separatorView.backgroundColor = AppColors.primaryColor.withAlphaComponent(0.5)
        separatorView.layer.cornerRadius = separatorView.frame.height/2
        separatorView.layer.masksToBounds = true
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
              let reference: UIImage = referenceImageImageView.image,
              let referenceData: Data = reference.pngData() else { return }
        
        viewModel.saveDrawingImgURL(drawingData)
        viewModel.saveReferenceImgURL(referenceData)
                
        let finishedVC: FinishedViewController = FinishedViewController()
        
        navigationController?.pushViewController(finishedVC, animated: true)
    }
}
