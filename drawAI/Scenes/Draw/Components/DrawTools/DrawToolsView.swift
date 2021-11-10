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
    @IBOutlet private weak var pencilButton: RoundedButton!
    @IBOutlet private weak var eraserButton: RoundedButton!
    
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
        pencilButton.borderWidth = 1
        eraserButton.borderWidth = 1
    }
    
    private func setupUIData() {
        guard let viewModel: DrawToolsViewModel = viewModel else { return }
        
        pencilButton.tintColor = viewModel.pencilButtonTintColor
        pencilButton.setImage(UIImage(named: viewModel.pencilButtonImageName), for: .normal)
        pencilButton.borderColor = viewModel.pencilButtonBorderColor
        
        eraserButton.tintColor = viewModel.eraserButtonTintColor
        eraserButton.setImage(UIImage(named: viewModel.eraserButtonImageName), for: .normal)
        eraserButton.borderColor = viewModel.eraserButtonBorderColor
    }
    
    private func chooseTool(_ tool: EnabledTool) {
        viewModel?.setEnabledTool(tool)
        setupUIData()
    }
}
