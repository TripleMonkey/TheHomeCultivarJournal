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
    
    @Binding var image: UIImage?
    @Binding var isShown: Bool
    
    init(image: Binding<UIImage?>, isShown: Binding<Bool>) {
        _image = image
        _isShown = isShown
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // Save to current selected object
            guard let data = uiImage.jpegData(compressionQuality: 1.0), let uiImage = UIImage(data: data) else {
                return
            }
            saveImage(image: uiImage)
        }
        isShown = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
    
    func saveImage(image: UIImage) {
        let imageAsset = ImageAsset(entity: ImageAsset.entity(), insertInto: PersistenceController.shared.container.viewContext)
        //let id = plantViewModel.ID
        //let reference = CKRecord.Reference(recordID: plantViewModel.ID, action: .deleteSelf)
        guard let data = image.jpegData(compressionQuality: 1.0) else { return }
        
        imageAsset.setValuesForKeys([
            "imageData": data,
     //       "referenceRecord": reference.recordID.recordName
        ])
        
        do {
            try PersistenceController.shared.container.viewContext.save()
            print("Image saved to CD")
        } catch {
            print("Image save error: \(error.localizedDescription)")
        }
    }
}
