//
//  UIImage+Extensions.swift
//  drawAI
//
//  Created by Leonardo Viana on 11/11/21.
//

import Foundation
import UIKit

extension UIImageView {
    func grayscaleImage() {
        let context = CIContext(options: nil)
        guard let image = self.image else { return }
        
        if let filter = CIFilter(name: "CIPhotoEffectNoir") {
            filter.setValue(CIImage(image: image), forKey: kCIInputImageKey)
            if let output = filter.outputImage {
                if let cgImage = context.createCGImage(output, from: output.extent) {
                    self.image = UIImage(cgImage: cgImage)
                }
            }
        }
    }
}
