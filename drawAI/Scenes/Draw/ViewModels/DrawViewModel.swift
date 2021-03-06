//
//  DrawViewModel.swift
//  drawAI
//
//  Created by Leonardo Viana on 26/10/21.
//

import Foundation
import UIKit

final class DrawViewModel {
    private let storageProvider: StorageProviderProtocol
    private var drawingImgURL: URL?
    private var referenceImgURL: URL?
        
    var referenceImg: UIImage {
        if let referenceImgURL = referenceImgURL {
            guard let refImg: UIImage = UIImage(contentsOfFile: referenceImgURL.path) else { return UIImage() }
            
            return refImg
        } else {
            let images: [UIImage] = ReferenceImagesData.shared.load()
            
            let imgIndex: Int = Int.random(in: 0..<images.count)
            
            return images[imgIndex]
        }
    }

    init(storageProvider: StorageProviderProtocol = FileManagerStorageProvider()) {
        self.storageProvider = storageProvider
    }
    
    convenience init(referenceImgURL: URL?) {
        self.init()
        self.referenceImgURL = referenceImgURL
    }
    
    func saveImageWithData(_ data: Data, name: String) -> URL? {
        guard let imgUrl: URL = storageProvider.saveImageUrl(data, name: name) else { return nil }
        
        return imgUrl
    }
    
    func saveDrawingImgURL(_ data: Data){
        drawingImgURL = saveImageWithData(data, name: AppSettings.Keys.drawingImgUrlKey)
    }
    
    func saveReferenceImgURL(_ data: Data){
        referenceImgURL = saveImageWithData(data, name: AppSettings.Keys.referenceImgUrlKey)
    }
}
