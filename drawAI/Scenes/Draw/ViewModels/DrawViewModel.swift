//
//  DrawViewModel.swift
//  drawAI
//
//  Created by Leonardo Viana on 26/10/21.
//

import Foundation

final class DrawViewModel {
    private let storageProvider: StorageProviderProtocol
    private var drawingImgURL: URL?
    private var referenceImgURL: URL?

    init(storageProvider: StorageProviderProtocol = FileManagerStorageProvider()) {
        self.storageProvider = storageProvider
    }
    
    func saveImageWithData(_ data: Data, name: String) -> URL?{
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
