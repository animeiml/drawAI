//
//  EndViewModel.swift
//  drawAI
//
//  Created by Leonardo Viana on 28/10/21.
//

import Foundation
import Vision

final class EndViewModel {
    private(set) var drawingImgUrl: URL
    private(set) var referenceImgUrl: URL
    private var similarityRatio: Int = 0

    init(drawingImgUrl: URL, referenceImgUrl: URL) {
        self.drawingImgUrl = drawingImgUrl
        self.referenceImgUrl = referenceImgUrl
    }
    
    func featureprintObservationForImage(atURL url: URL) -> VNFeaturePrintObservation? {
        let requestHandler: VNImageRequestHandler = VNImageRequestHandler(url: url, options: [:])
        let request: VNGenerateImageFeaturePrintRequest = VNGenerateImageFeaturePrintRequest()
        do {
            try requestHandler.perform([request])
            return request.results?.first as? VNFeaturePrintObservation
        } catch {
            print("Vision error: \(error)")
            return nil
        }
    }
    
    func processImages() -> Int {
        guard let originalFPO = featureprintObservationForImage(atURL: referenceImgUrl) else {
            return 0
        }
        // Generate featureprints for copies and compute distances from original featureprint.
        if let contestantFPO: VNFeaturePrintObservation = featureprintObservationForImage(atURL: drawingImgUrl) {
                do {
                    var distanceSimilarity: Float = Float(0)
                    try contestantFPO.computeDistance(&distanceSimilarity, to: originalFPO)
                    similarityRatio = Int(distanceSimilarity)
                } catch {
                    print("Error computing distance between featureprints.")
                }
            }
        return similarityRatio
    }
    
    func removeSavedImages() {
        let fileMgr = FileManager.default
            try? fileMgr.removeItem(at: drawingImgUrl)
            try? fileMgr.removeItem(at: referenceImgUrl)
    }
}
