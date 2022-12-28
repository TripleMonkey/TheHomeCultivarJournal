//
//  ImagePickerCoordinator.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 11/22/22.
//

import Foundation
import SwiftUI
import CloudKit
import CoreData

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @EnvironmentObject var plantVM: PlantViewModel
    var objectID: NSManagedObjectID
    @Binding var image: UIImage?
    @Binding var isShown: Bool
    
    init(objectID: NSManagedObjectID, image: Binding<UIImage?>, isShown: Binding<Bool>) {
        self.objectID = objectID
        _image = image
        _isShown = isShown
    }
    
    // Cancel image selection
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // Convert UIImage to Data
            guard let data = uiImage.jpegData(compressionQuality: 1.0) else {
                return
            }
            // Save Data to imageAsset
            saveImageAsset(data: data)
        }
        isShown = false
    }
    
    func saveImageAsset(data: Data) {
        // Create ImageAsset for Context
        let imageAsset = ImageAsset(entity: ImageAsset.entity(), insertInto: PersistenceController.shared.container.viewContext)
        // Assign data value to ImageAsset
        imageAsset.setValuesForKeys([
            "imageData": data,
        ])
        // Save to current plant and CD or print error
        plantVM.currentImageAsset = imageAsset
        do {
            try PersistenceController.shared.container.viewContext.save()
            print("Image saved to CD")
        } catch {
            print("Image save error: \(error.localizedDescription)")
        }
    }
}
