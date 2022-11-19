//
//  ImagePickerModel.swift
//  GrowHome
//
//  Created by Nigel Krajewski on 6/29/22.
//
import Foundation
import SwiftUI
import CloudKit
import CoreData

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //@ObservedObject var modelData = ModelData.shared
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ImageAsset.objectID, ascending: true)], animation: .default) private var images: FetchedResults<Plant>
    
    @Binding var image: UIImage?
    @Binding var isShown: Bool
    
    init(image: Binding<UIImage?>, isShown: Binding<Bool>) {
        _image = image
        _isShown = isShown
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // Save to current selected object from modelData
            guard let data = uiImage.jpegData(compressionQuality: 1.0) else {
                return
            }
            guard let uiImage = UIImage(data: data) else {
                return
            }
            saveImage(image: uiImage)
        }
        isShown = false
        //DEBUG
        //print(modelData.selectedObject?.imagesData.count ?? -1)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
    
    func saveImage(image: UIImage) {
        let imageRecord: CKRecord = image.rec
        //let reference = CKRecord.Reference(recordID: modelData.selectedObject!.record.recordID, action: .deleteSelf)
        imageRecord.setValuesForKeys([
            "Data": image.dataFromImage,
            //"ReferenceRecordID": reference
        ])
        guard let _: Plant = modelData.selectedObject else { return }
        var count = 1
        CloudKitUtility.addRecord(item: image, completion: { result in
            DispatchQueue.main.async {

                print(count)
                count += 1
           //     self.modelData.selectedObject!.imagesData.append(imageRecord.object(forKey: "DataFromImage") as? Data ?? Data())
            }
        })
    }
}

struct ImagePickerModel: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIImagePickerController
    typealias Coordinator = ImagePickerCoordinator
    
    @Binding var image: UIImage?
    @Binding var isShown: Bool
    
    var sourceType: UIImagePickerController.SourceType = .camera
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context:
                                UIViewControllerRepresentableContext<ImagePickerModel>) {
    }
    
    func makeCoordinator() -> ImagePickerModel.Coordinator {
        return ImagePickerCoordinator(image: $image, isShown: $isShown)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerModel>) ->
    UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
}
