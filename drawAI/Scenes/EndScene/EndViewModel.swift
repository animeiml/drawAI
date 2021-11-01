//
//  EndViewModel.swift
//  drawAI
//
//  Created by Leonardo Viana on 28/10/21.
//

import Foundation

final class EndViewModel {
    private(set) var drawingImgUrl: URL
    private(set) var referenceImgUrl: URL

    init(drawingImgUrl: URL, referenceImgUrl: URL) {
        self.drawingImgUrl = drawingImgUrl
        self.referenceImgUrl = referenceImgUrl
    }
}
