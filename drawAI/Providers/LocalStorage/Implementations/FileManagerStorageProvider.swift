//
//  FileManagerStorageProvider.swift
//  drawAI
//
//  Created by Leonardo Viana on 27/10/21.
//

import Foundation

final class FileManagerStorageProvider: StorageProviderProtocol {
    func saveImageUrl(_ imgData: Data) -> URL? {
        let baseURL = FileManager.default.temporaryDirectory
        
        let imageURL = baseURL.appendingPathComponent(UUID().uuidString).appendingPathExtension("png")
        
        do {
            try imgData.write(to: imageURL)
            
            return imageURL
        } catch {
            return nil
        }
    }
}
