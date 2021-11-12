//
//  EndViewModel.swift
//  drawAI
//
//  Created by Leonardo Viana on 28/10/21.
//

import Foundation
import Vision
import UIKit

final class EndViewModel {
    private(set) var drawingImgUrl: URL
    private(set) var referenceImgUrl: URL
    private var similarityRatio: Float = 0.0
    private let maxPossibleValue: Int = 30
    
    var formattedScore: String {
        let score: Float = (10 * similarityRatio) / Float(maxPossibleValue/10)
        
        return "\(String(format: "%.1f", score))%"
    }
    
    init(storageProvider: StorageProviderProtocol = FileManagerStorageProvider()) {
        self.drawingImgUrl = storageProvider.retrieveUrlForImageWithName(AppSettings.Keys.drawingImgUrlKey)
        self.referenceImgUrl = storageProvider.retrieveUrlForImageWithName(AppSettings.Keys.referenceImgUrlKey)
        
        processImages()
    }
        
    func processImages() {
        guard let drawingImg: UIImage = UIImage(contentsOfFile: drawingImgUrl.path),
              let referenceImg: UIImage = UIImage(contentsOfFile: referenceImgUrl.path)?.withBackground(color: .white) else {
                  return
              }
        
        guard let similarityRatio = referenceImg.similarity(to: drawingImg) else { return }
        
        self.similarityRatio = Float(maxPossibleValue) - similarityRatio
    }
    
    func removeSavedImages() {
        let fileMgr = FileManager.default
        try? fileMgr.removeItem(at: drawingImgUrl)
        try? fileMgr.removeItem(at: referenceImgUrl)
    }
    
    func buildDrawViewModel() -> DrawViewModel {
        return DrawViewModel(referenceImgURL: referenceImgUrl)
    }
}
