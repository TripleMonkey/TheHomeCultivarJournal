//
//  ImagePickerModel.swift
//  GrowHome
//
//  Created by Nigel Krajewski on 6/29/22.
//

import Foundation
import SwiftUI

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
