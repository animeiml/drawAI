//
//  DrawViewModel.swift
//  drawAI
//
//  Created by Leonardo Viana on 26/10/21.
//

import Foundation

final class DrawViewModel {
    private let storageProvider: StorageProviderProtocol
    private var imgUrl: URL?
    
    init(storageProvider: StorageProviderProtocol = FileManagerStorageProvider()) {
        self.storageProvider = storageProvider
    }
    
    func saveImageWithData(_ data: Data) {
        guard let imgUrl: URL = storageProvider.saveImageUrl(data) else { return }
        
        self.imgUrl = imgUrl
    }
    
    func buildEndViewModel() -> EndViewModel? {
        guard let imgUrl: URL = imgUrl else {
            return nil
        }
        
        let viewModel: EndViewModel = EndViewModel(drawingImgUrl: imgUrl)
        
        return viewModel
    }
}
