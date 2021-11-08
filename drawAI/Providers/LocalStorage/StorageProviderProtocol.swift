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
    
    func saveImageUrl(_ imgData: Data, name: String) -> URL?
    
    func retrieveUrlForImageWithName(_ name: String) -> URL
}

extension StorageProviderProtocol {
    func saveImageData(_ dataRepresentation: Data) { }
    
    func retrieveImageData() -> Data? { return nil }
    
    func saveImageUrl(_ imgData: Data, name: String) -> URL? { return nil }
    
    func retrieveUrlForImageWithName(_ name: String) -> URL { return URL(fileReferenceLiteralResourceName: "") }
}
