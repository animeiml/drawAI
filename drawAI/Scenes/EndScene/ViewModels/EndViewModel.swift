//
//  EndViewModel.swift
//  drawAI
//
//  Created by Leonardo Viana on 28/10/21.
//

import Foundation

final class EndViewModel {
    private(set) var drawingImgUrl: URL
    
    init(drawingImgUrl: URL) {
        self.drawingImgUrl = drawingImgUrl
    }
}
