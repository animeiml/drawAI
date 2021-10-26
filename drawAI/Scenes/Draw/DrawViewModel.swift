//
//  DrawViewModel.swift
//  drawAI
//
//  Created by Leonardo Viana on 26/10/21.
//

import Foundation

final class DrawViewModel {
    private let storageProvider: StorageProviderProtocol
    
    init(storageProvider: StorageProviderProtocol = DefaultsStorageProvider()) {
        self.storageProvider = storageProvider
    }
    
    func saveData(_ data: Data) {
        storageProvider.saveImageData(data)
    }
}
