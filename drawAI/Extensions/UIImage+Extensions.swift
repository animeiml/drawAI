//
//  UIImage+Extensions.swift
//  drawAI
//
//  Created by Leonardo Viana on 11/11/21.
//

import Foundation
import UIKit
import Vision

extension UIImage {
    var cgImageOrientation: CGImagePropertyOrientation {
        switch self.imageOrientation {
            case .up: return .up
            case .down: return .down
            case .left: return .left
            case .right: return .right
            case .upMirrored: return .upMirrored
            case .downMirrored: return .downMirrored
            case .leftMirrored: return .leftMirrored
            case .rightMirrored: return .rightMirrored
        }
    }
    
    func similarity(to image: UIImage) -> Float? {
        var similarity: Float = 0
        
        guard let firstImageFPO = self.featurePrintObservation(),
            let secondImageFPO = image.featurePrintObservation(),
            let _ = try? secondImageFPO.computeDistance(
                &similarity,
                to: firstImageFPO
            ) else {
                return nil
        }

        return similarity
    }
            
    func withBackground(color: UIColor, opaque: Bool = true) -> UIImage {
      UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
          
      guard let ctx = UIGraphicsGetCurrentContext(), let image = cgImage else { return self }
      defer { UIGraphicsEndImageContext() }
          
      let rect = CGRect(origin: .zero, size: size)
      ctx.setFillColor(color.cgColor)
      ctx.fill(rect)
      ctx.concatenate(CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: size.height))
      ctx.draw(image, in: rect)
          
      return UIGraphicsGetImageFromCurrentImageContext() ?? self
    }
}

extension UIImage {
    private func featurePrintObservation() -> VNFeaturePrintObservation? {
        guard let cgImage = self.cgImage else { return nil }

        let requestHandler =
            VNImageRequestHandler(cgImage: cgImage,
            orientation: self.cgImageOrientation,
            options: [:]
        )

        let request = VNGenerateImageFeaturePrintRequest()
        if let _ = try? requestHandler.perform([request]),
            let result = request.results?.first
                as? VNFeaturePrintObservation {
            return result
        }

        return nil
    }
}
