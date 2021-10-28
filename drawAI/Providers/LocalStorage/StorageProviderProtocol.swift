//
//  LocalStorageProtocol.swift
//  drawAI
//
//  Created by Leonardo Viana on 26/10/21.
//

import Foundation

protocol StorageProviderProtocol {
    func saveImageData(_ dataRepresentation: Data)
    
    func retrieveImageData() -> Data?
    
    func saveImageUrl(_ imgData: Data) -> URL?
}

extension StorageProviderProtocol {
    func saveImageData(_ dataRepresentation: Data) { }
    
    func retrieveImageData() -> Data? { return nil }
    
    func saveImageUrl(_ imgData: Data) -> URL? { return nil }
}
