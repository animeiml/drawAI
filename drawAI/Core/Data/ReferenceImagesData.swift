//
//  ReferenceImagesData.swift
//  drawAI
//
//  Created by Leonardo Viana on 11/11/21.
//

import UIKit
import Foundation

struct ReferenceImagesData {
    static var shared: ReferenceImagesData = {
        let instance: ReferenceImagesData = ReferenceImagesData()
        
        return instance
    }()
    
    private init() { }
}

extension ReferenceImagesData {
    func load() -> [UIImage] {
        let paths: [String] = loadImagePaths()
        var images: [UIImage] = []
        
        for path in paths {
            if let image: UIImage = UIImage(contentsOfFile: path) {
                images.append(image)
            }
        }
        
        return images
    }
}

extension ReferenceImagesData {
    private func loadImagePaths() -> [String] {
        let fileManager: FileManager = FileManager.default
        let path: String = Bundle.main.bundlePath + "/ReferenceImages"
        
        var paths: [String] = []
        
        do {
            let items: [String] = try fileManager.contentsOfDirectory(atPath: path)
            
            for item in items {
                paths.append("\(path)/\(item)")
            }
            
            return paths
        } catch  {
            return []
        }
    }
}
