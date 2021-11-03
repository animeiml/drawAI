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

        pencilButton.setRounded()
        eraserButton.setRounded()

        super.awakeFromNib()
    }
    
    @IBAction func onPencilTouched(_ sender: Any) {
        delegate?.onPencilChosen()
    }
    
    @IBAction func onEraserTouched(_ sender: Any) {
        delegate?.onEraserChosen()
    }
}
