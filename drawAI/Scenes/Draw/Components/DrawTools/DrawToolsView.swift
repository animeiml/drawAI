//
//  DrawToolsView.swift
//  drawAI
//
//  Created by Leonardo Viana on 20/10/21.
//

import Foundation
import UIKit
import GameKit

enum EnabledTool {
    case pencil
    case eraser
}

protocol DrawToolsDelegate: AnyObject {
    func onPencilChosen()
    func onEraserChosen()
}

class DrawToolsView: ANView {
    @IBOutlet private weak var pencilButton: UIButton!
    @IBOutlet private weak var eraserButton: UIButton!
    
    weak var delegate: DrawToolsDelegate?
    
    private var viewModel: DrawToolsViewModel?
        
    override func awakeFromNib() {
        setupUI()
        super.awakeFromNib()
    }
    
    @IBAction func onPencilTouched(_ sender: Any) {
        delegate?.onPencilChosen()
        chooseTool(.pencil)
    }
    
    @IBAction func onEraserTouched(_ sender: Any) {
        delegate?.onEraserChosen()
        chooseTool(.eraser)
    }
}

extension DrawToolsView {
    func setup(viewModel: DrawToolsViewModel = DrawToolsViewModel()) {
        self.viewModel = viewModel
        
        setupUI()
        setupUIData()
    }
}

extension DrawToolsView {
    private func setupUI() {
        pencilButton.layer.borderWidth = 1
        eraserButton.layer.borderWidth = 1
        
        pencilButton.setRounded()
        eraserButton.setRounded()
    }
    
    private func setupUIData() {
        guard let viewModel: DrawToolsViewModel = viewModel else { return }
        
        pencilButton.tintColor = viewModel.pencilButtonTintColor
        pencilButton.layer.borderColor = viewModel.pencilButtonBorderColor
        pencilButton.setImage(UIImage(named: viewModel.pencilButtonImageName), for: .normal)
        
        eraserButton.tintColor = viewModel.eraserButtonTintColor
        eraserButton.layer.borderColor = viewModel.eraserButtonBorderColor
        eraserButton.setImage(UIImage(named: viewModel.eraserButtonImageName), for: .normal)
    }
    
    private func chooseTool(_ tool: EnabledTool) {
        viewModel?.setEnabledTool(tool)
        setupUIData()
    }
}
