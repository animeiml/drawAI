//
//  iPadDrawViewController.swift
//  drawAI
//
//  Created by Leonardo Viana on 28/10/21.
//

import UIKit

class iPadDrawViewController: UIViewController {
    
    @IBOutlet private weak var timeBarView: DrawTimerBarView!
    @IBOutlet private weak var toolsView: DrawToolsView!
    @IBOutlet private weak var referenceImageView: UIImageView!
    @IBOutlet private weak var canvasView: CanvasView!
    
    // MARK: Dynamic Constraints
    @IBOutlet private weak var drawTimeBarTraillingPortraitConstraint: NSLayoutConstraint!
    @IBOutlet private weak var drawTimeBarLeadingPortraitConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var drawTimeBarCenterXLandscapeConstraint: NSLayoutConstraint!
    @IBOutlet private weak var drawTimeBarWidthLandscapeConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var referenceDrawingCenterXPortraitConstraint: NSLayoutConstraint!
    @IBOutlet private weak var referenceDrawingTopPortraitConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var drawToolsTraillingPortraitConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var drawToolsLeadingLandscapeConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var referenceDrawingLeadingLandscapeConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var referenceDrawingCenterYLandscapeConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var canvasViewBottomPortraitConstraint: NSLayoutConstraint!
    @IBOutlet private weak var canvasViewTopPortraitconstraint: NSLayoutConstraint!
    @IBOutlet private weak var canvasViewTraillingPortraitConstraint: NSLayoutConstraint!
    @IBOutlet private weak var canvasViewLeadingPortraitConstraint: NSLayoutConstraint!
    @IBOutlet private weak var canvasViewTopLandscapeConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var canvasViewLeadingLandscapeConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var canvasViewTrailingLandscapeConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var canvasViewBottomLandscapeConstraint: NSLayoutConstraint!
    
    private var viewModel: DrawViewModel
    
    override func viewDidAppear(_ animated: Bool) {
        canvasView.setupDrawing()
        applyOrientationConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toolsView.delegate = self
        timeBarView.delegate = self
        
        timeBarView.startTimer()
        view.backgroundColor = AppColors.backgroundColor
        referenceImageView.backgroundColor = AppColors.backgroundColor
        
        canvasView.layer.cornerRadius = canvasView.frame.height * 0.0549
        canvasView.layer.borderWidth = 1
        canvasView.layer.borderColor = AppColors.primaryColor.cgColor
        
        referenceImageView.layer.cornerRadius = canvasView.frame.height * 0.0549
        referenceImageView.layer.borderWidth = 1
        referenceImageView.layer.borderColor = AppColors.primaryColor.cgColor
        
//        toolsView.layer.cornerRadius = canvasView.frame.height * 0.0549
//        toolsView.layer.borderWidth = 1
//        toolsView.layer.borderColor = AppColors.primaryColor.cgColor
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        applyOrientationConstraints()
    }
    
    init(viewModel: DrawViewModel = DrawViewModel()) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension iPadDrawViewController: DrawTimerBarDelegate {
    func didFinishTime() {
        guard let drawing: UIImage = canvasView.captureDrawImage(),
              let drawingData: Data = drawing.pngData(),
              let reference: UIImage = UIImage(named: "espadinha"),
              let referenceData: Data = reference.pngData() else { return }
        
        viewModel.saveDrawingImgURL(drawingData)
        viewModel.saveReferenceImgURL(referenceData)
                
        let finishedVC: IpadFinishedViewController = IpadFinishedViewController()
        
        navigationController?.pushViewController(finishedVC, animated: true)
    }
}

extension iPadDrawViewController: DrawToolsDelegate {
    func onPencilChosen() {
        canvasView.chooseTool(.pencil)
    }
    
    func onEraserChosen() {
        canvasView.chooseTool(.eraser)
    }
}

// MARK: Dynamic Constraints Functions
extension iPadDrawViewController {
    private func applyOrientationConstraints() {
        if UIDevice.current.orientation.isPortrait {
            applyPortraitDynamicConstraints()
        } else if UIDevice.current.orientation.isLandscape {
            applyLandscapeDynamicConstraints()
        }
    }
    
    private func applyPortraitDynamicConstraints() {
        NSLayoutConstraint.activate([
            drawTimeBarLeadingPortraitConstraint,
            drawTimeBarTraillingPortraitConstraint,
            drawToolsTraillingPortraitConstraint,
            referenceDrawingTopPortraitConstraint,
            referenceDrawingCenterXPortraitConstraint,
            canvasViewBottomPortraitConstraint,
            canvasViewTopPortraitconstraint,
            canvasViewTraillingPortraitConstraint,
            canvasViewLeadingPortraitConstraint
        ])
        
        NSLayoutConstraint.deactivate([
            drawTimeBarCenterXLandscapeConstraint,
            drawTimeBarWidthLandscapeConstraint,
            drawToolsLeadingLandscapeConstraint,
            referenceDrawingLeadingLandscapeConstraint,
            referenceDrawingCenterYLandscapeConstraint,
            canvasViewTopLandscapeConstraint,
            canvasViewLeadingLandscapeConstraint,
            canvasViewTrailingLandscapeConstraint,
            canvasViewBottomLandscapeConstraint
        ])
    }
    
    private func applyLandscapeDynamicConstraints() {
        NSLayoutConstraint.deactivate([
            drawTimeBarLeadingPortraitConstraint,
            drawTimeBarTraillingPortraitConstraint,
            drawToolsTraillingPortraitConstraint,
            referenceDrawingTopPortraitConstraint,
            referenceDrawingCenterXPortraitConstraint,
            canvasViewBottomPortraitConstraint,
            canvasViewTopPortraitconstraint,
            canvasViewTraillingPortraitConstraint,
            canvasViewLeadingPortraitConstraint
        ])

        NSLayoutConstraint.activate([
            drawTimeBarCenterXLandscapeConstraint,
            drawTimeBarWidthLandscapeConstraint,
            drawToolsLeadingLandscapeConstraint,
            referenceDrawingLeadingLandscapeConstraint,
            referenceDrawingCenterYLandscapeConstraint,
            canvasViewTopLandscapeConstraint,
            canvasViewLeadingLandscapeConstraint,
            canvasViewTrailingLandscapeConstraint,
            canvasViewBottomLandscapeConstraint
        ])
    }
}
