//
//  DrawToolsViewModel.swift
//  drawAI
//
//  Created by Leonardo Viana on 10/11/21.
//

import UIKit

final class DrawToolsViewModel {
    private var enabledTool: EnabledTool = .pencil
    
    var isPencilEnabled: Bool {
        return enabledTool == .pencil
    }
    
    var isEraserEnabled: Bool {
        return enabledTool == .eraser
    }
    
    var pencilButtonTintColor: UIColor {
        return isPencilEnabled ? AppColors.primaryColor.withAlphaComponent(0.15) : AppColors.disabledColor.withAlphaComponent(0.15)
    }
    
    var pencilButtonBorderColor: UIColor {
        return isPencilEnabled ? AppColors.primaryColor.withAlphaComponent(0.20) : AppColors.disabledColor.withAlphaComponent(0.20)
    }
    
    var pencilButtonImageName: String {
        return isPencilEnabled ? "pencil" : "pencil-disable"
    }
    
    var eraserButtonTintColor: UIColor {
        return isEraserEnabled ? AppColors.primaryColor.withAlphaComponent(0.15) : AppColors.disabledColor.withAlphaComponent(0.15)
    }
    
    var eraserButtonBorderColor: UIColor {
        return isEraserEnabled ? AppColors.primaryColor.withAlphaComponent(0.20) : AppColors.disabledColor.withAlphaComponent(0.20)
    }
    
    var eraserButtonImageName: String {
        return isEraserEnabled ? "eraser" : "eraser-disable"
    }

}

extension DrawToolsViewModel {
    func setEnabledTool(_ tool: EnabledTool) {
        enabledTool = tool
    }
}
