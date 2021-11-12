//
//  UserDefaultsLocalStorage.swift
//  drawAI
//
//  Created by Leonardo Viana on 26/10/21.
//

import Foundation

final class DefaultsStorageProvider: StorageProviderProtocol {
    func saveImageData(_ dataRepresentation: Data) {
        UserDefaults.standard.set(dataRepresentation, forKey: AppSettings.Keys.userLastDraw)
    }
    
    func retrieveImageData() -> Data? {
        guard let data: Data = UserDefaults.standard.object(forKey: AppSettings.Keys.userLastDraw) as? Data else { return nil }
        
        return data
    }
}
