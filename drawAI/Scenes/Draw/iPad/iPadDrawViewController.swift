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
              let drawingData: Data = drawing.pngData() else { return }
        
//        viewModel.saveImageWithData(drawingData)
//
//        guard let endViewModel: EndViewModel = viewModel.buildEndViewModel() else { return }
        
        // TODO: Navigate to the iPadEndViewController
        
      //  let endViewController: IpadEndViewController = IpadEndViewController(viewModel: endViewModel)

     //  navigationController?.pushViewController(endViewController, animated: true)
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
