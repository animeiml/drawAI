//
//  DrawToolsView.swift
//  drawAI
//
//  Created by Leonardo Viana on 20/10/21.
//

import Foundation
import UIKit

protocol DrawToolsDelegate: AnyObject {
    func onPencilChosen()
    func onEraserChosen()
}

class DrawToolsView: ANView {
    weak var delegate: DrawToolsDelegate?
    
    @IBOutlet private weak var pencilButton: UIButton!
    @IBOutlet private weak var eraserButton: UIButton!
    
    override func awakeFromNib() {
        debugPrint("==== \(pencilButton.frame) ====")
        
        pencilButton.tintColor = AppColors.primaryColor.withAlphaComponent(0.15)
        pencilButton.layer.borderColor = AppColors.primaryColor.withAlphaComponent(0.20).cgColor
        pencilButton.layer.borderWidth = 1
        pencilButton.setImage(UIImage(named: "pencil"), for: .normal)
    
        eraserButton.tintColor = AppColors.disabledColor.withAlphaComponent(0.15)
        eraserButton.layer.borderColor = AppColors.disabledColor.withAlphaComponent(0.20).cgColor
        eraserButton.layer.borderWidth = 1
        eraserButton.setImage(UIImage(named: "eraser-disable"), for: .normal)
        

        pencilButton.setRounded()
        eraserButton.setRounded()
        
        

        super.awakeFromNib()
    }
    
    @IBAction func onPencilTouched(_ sender: Any) {
        delegate?.onPencilChosen()
        
        pencilButton.tintColor = AppColors.primaryColor.withAlphaComponent(0.15)
        pencilButton.layer.borderColor = AppColors.primaryColor.withAlphaComponent(0.20).cgColor
        pencilButton.layer.borderWidth = 1
        pencilButton.setImage(UIImage(named: "pencil"), for: .normal)
        
        eraserButton.tintColor = AppColors.disabledColor.withAlphaComponent(0.15)
        eraserButton.layer.borderColor = AppColors.disabledColor.withAlphaComponent(0.20).cgColor
        eraserButton.layer.borderWidth = 1
        eraserButton.setImage(UIImage(named: "eraser-disable"), for: .normal)
        
    }
    
    @IBAction func onEraserTouched(_ sender: Any) {
        delegate?.onEraserChosen()
        
        pencilButton.tintColor = AppColors.disabledColor.withAlphaComponent(0.15)
        pencilButton.layer.borderColor = AppColors.disabledColor.withAlphaComponent(0.20).cgColor
        pencilButton.layer.borderWidth = 1
        pencilButton.setImage(UIImage(named: "pencil-disable"), for: .normal)
        
        eraserButton.tintColor = AppColors.primaryColor.withAlphaComponent(0.15)
        eraserButton.layer.borderColor = AppColors.primaryColor.withAlphaComponent(0.20).cgColor
        eraserButton.layer.borderWidth = 1
        eraserButton.setImage(UIImage(named: "eraser"), for: .normal)
    }
}
