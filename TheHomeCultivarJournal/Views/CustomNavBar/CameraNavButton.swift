//
//  CameraNavButton.swift
//  GrowHome
//
//  Created by Nigel Krajewski on 6/5/22.
//

import SwiftUI

struct CameraNavButton: View {
    
    @Environment(\.managedObjectContext) var context
    let cameraIcon: Image = Image(systemName: "camera.fill")
    
    @State private var showOptionsDialog: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var showImageSheet: Bool = false
    @State private var image: UIImage?
    
    var body: some View {
        Button(action: {showOptionsDialog.toggle()}, label: {
            cameraIcon
                .sfRoundFont(for: .title)
                .offset(y: -3)
        })
        .sheet(isPresented: $showImageSheet, content: {
            ImagePickerViewModel(image: $image, isShown: $showImageSheet, sourceType: self.sourceType)
                .environment(\.managedObjectContext, context)
        })
        .confirmationDialog("Get image from",
                            isPresented: $showOptionsDialog) {
            Button("Camera", action: {
                sourceType = .camera
                showImageSheet = true
            })
            Button("Photo Library", action: {
                showImageSheet = true
                self.sourceType = .photoLibrary
            })
        }
    }
}

struct CameraNavLink_Previews: PreviewProvider {
    
    static var previews: some View {
        CameraNavButton()
    }
}
