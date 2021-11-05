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
    
    func saveImageWithData(_ data: Data) -> URL?{
        guard let imgUrl: URL = storageProvider.saveImageUrl(data) else { return nil }
        return imgUrl
    }
    
    func saveDrawingImgURL(_ data: Data){
        drawingImgURL = saveImageWithData(data)
    }
    
    func saveReferenceImgURL(_ data: Data){
        referenceImgURL = saveImageWithData(data)
    }
    
    func buildEndViewModel() -> EndViewModel? {
        guard let drawingImgUrl: URL = drawingImgURL,
              let referenceImgUrl: URL = referenceImgURL else {
            return nil
        }
        
        let viewModel: EndViewModel = EndViewModel(drawingImgUrl: drawingImgUrl, referenceImgUrl: referenceImgUrl)
        
        return viewModel
    }
}
