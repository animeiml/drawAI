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
}
