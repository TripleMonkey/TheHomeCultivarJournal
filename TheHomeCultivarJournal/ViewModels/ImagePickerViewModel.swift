//
//  ImagePickerViewModel.swift
//  GrowHome
//
//  Created by Nigel Krajewski on 6/29/22.
//

import Foundation
import SwiftUI
import CoreData

struct ImagePickerViewModel: UIViewControllerRepresentable {
    
    typealias viewContext = UIViewControllerRepresentableContext<ImagePickerViewModel>
    
    @ObservedObject var dataVM = DataViewModel.shared
    @Binding var image: UIImage?
    @Binding var isShown: Bool
    
    var sourceType: UIImagePickerController.SourceType = .camera
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: viewContext) {
    }
     
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(objectID: getObjectID(), image: $image, isShown: $isShown)
    }
    
    func makeUIViewController(context: viewContext) ->
    UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func getObjectID() -> NSManagedObjectID {
        var id: NSManagedObjectID
        if let objectID = dataVM.currentPlant?.objectID {
            id = objectID
        } else {
            id = NSManagedObjectID()
        }
        print("\(id)")
        return id
    }
}
