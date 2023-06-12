//
//  ImageAssetsFileManager.swift
//  FileManagerAndCache
//
//  Created by Nigel Krajewski on 2/17/23.
//

import Foundation
import SwiftUI


class ImageAssetsFileManager {
    
    let folderName = "downloaded_photos"
    // Singleton
    static let shared = ImageAssetsFileManager()
    private init() {
        createFolderIfNeeded()
    }
    
    private func createFolderIfNeeded() {
        guard let url = getFolderPath() else { return }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
                print("Created folder")
            } catch let error {
                print("Error creating folder: \(error.localizedDescription)")
            }
        }
    }
    
    private func getFolderPath() -> URL? {
        return FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathExtension(folderName)
    }
    
    private func getImagePath(key: String) -> URL? {
        guard let folder = getFolderPath() else {
            return nil
        }
        return folder.appendingPathExtension(key + ".jpg")
    }
    
    func add(key: String, imageAsset: ImageAsset) {
        let data = imageAsset.uwThumbnailData
        let url = getImagePath(key: key)
        
        do {
            try data.write(to: url!)
            
        } catch let error {
            print("Error saving to file manager: \(error.localizedDescription)")
        }
    }
    
    func get(key: String) -> URL? {
        guard let url = getImagePath(key: key),
              FileManager.default.fileExists(atPath: url.path) else { return nil }
        return url
    }
    
}
