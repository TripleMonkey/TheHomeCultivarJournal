//
//  CustomNavBarView.swift
//  GrowHome
//
//  Created by Nigel Krajewski on 3/29/22.
//

import SwiftUI
import CoreData

struct CustomNavBarView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var addButtonTapped = false
    
    let isParentNavBarView: Bool
    let title: String
    let backButtonTitle: String
    let cameraButtonIsVisible: Bool
    
    var body: some View {
        HStack {
            leftButtonView(isParent: isParentNavBarView)
            Spacer()
            titleSection
            Spacer()
            rightButtonView(isParent: isParentNavBarView, showCameraButton: cameraButtonIsVisible)
        }
        .padding()
        .background(Color.brown.opacity(0.2))
        
        // Present new sheet when tapped
        .sheet(isPresented: $addButtonTapped) {
            EditPlantSheet()
                .environmentObject(PlantViewModel())
        }
    }
    
}

//MARK: PREVIEW
struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomNavBarView(isParentNavBarView: false, title: "Preview", backButtonTitle: "back", cameraButtonIsVisible: true)
        }
    }
}


//MARK: Buttons
extension CustomNavBarView {
    
    @ViewBuilder
    private func leftButtonView(isParent: Bool) -> some View {
        if isParent {
            editButton
        } else {
            backButton
        }
    }
    
    @ViewBuilder
    private func rightButtonView(isParent: Bool, showCameraButton: Bool) -> some View {
        if isParent {
            addButton
        } else if showCameraButton {
            cameraButton
        } else {
            backButton
                .hidden()
        }
    }
    
    private var backButton: some View {
        ZStack {
            Button(action: {
                dismiss()
            }, label: {
                HStack {
                    Image(systemName: "chevron.left")
                    Text(backButtonTitle)
                        .fontWeight(.semibold)
                        .sfRoundFont()
                        .offset(x: -7)
                }
            })
        }
        
    }
    
    private var titleSection: some View {
        HStack(spacing: 4) {
            Text(title)
                .fontWeight(.bold)
                .sfRoundFont(for: .title2)
                .foregroundColor(.purple)
                .lineLimit(1)
        }
    }
    
    private var editButton: some View {
        // Keeps title centered and buttons fixed
        ZStack(alignment: .leading){
            cameraButton
                .hidden()
            EditButton()
                .sfRoundFont()
        }
    }
    
    private var addButton: some View {
        // Keeps title centered and buttons fixed
        ZStack(alignment: .trailing){
            
            editButton
                .hidden()
            Button(action: {
                addButtonTapped.toggle()
            })
            {
                Label("", systemImage: "plus")
            }
        }
    }
    
    private var cameraButton: some View {
        // Keep title centered and buttons fixed
        ZStack(alignment: .trailing){
            backButton
                .hidden()
            CameraNavButton()
                .sfRoundFont()
        }
    }
}
