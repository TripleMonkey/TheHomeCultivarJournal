//
//  CustomNavBarView.swift
//  GrowHome
//
//  Created by Nigel Krajewski on 3/29/22.
//

import SwiftUI
import CoreData

struct CustomNavBarView: View {
    
    // Wrapped variables
    @Environment(\.dismiss) var dismiss
    @State var addButtonTapped = false
    @Binding var showSettings: Bool
    
    
    // View constants
    let isParentNavBarView: Bool
    let title: String
    let backButtonTitle: String
    let cameraButtonIsVisible: Bool
    
    var body: some View {
        HStack {
            leftButtonView(isParent: isParentNavBarView)
                .padding(20)
            Spacer()
            titleSection
            Spacer()
            rightButtonView(isParent: isParentNavBarView, showCameraButton: cameraButtonIsVisible)
                .padding(20)
        }
        .sfRoundFont(for: .title)
        .background(Color("NavBgColor"))
        
        // Present new sheet when tapped
        .sheet(isPresented: $addButtonTapped) {
            EditPlantSheet()
                .animation(.easeInOut, value: 10)
                .environmentObject(PlantViewModel())
        }
    }
}

//MARK: PREVIEW
//struct CustomNavBarView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        VStack {
//            CustomNavBarView(isParentNavBarView: true, title: "Preview", showSettings: <#Binding<Bool>#>, backButtonTitle: "back", cameraButtonIsVisible: false)
//            Spacer()
//        }
//    }
//}


//MARK: Buttons/Components
extension CustomNavBarView {
    
    @ViewBuilder
    private func leftButtonView(isParent: Bool) -> some View {
        if isParent {
            settingsButton
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
    
    private var titleSection: some View {
        HStack(spacing: 4) {
            Text(title)
                .fontWeight(.bold)
                .sfRoundFont(for: .title2)
                .foregroundColor(.purple)
                .lineLimit(1)
        }
    }
    
    private var backButton: some View {
        Button(action: {
            dismiss()
        }, label: {
            HStack {
                Image(systemName: "chevron.left")
                Text(backButtonTitle)
                    .sfRoundFont(for: .headline)
                    .frame(minHeight: 45)
                    .offset(x: -7)
            }
        })
    }
    
    private var settingsButton: some View {
        
        // Keeps title centered and buttons fixed
        ZStack(alignment: .leading){
            backButton
                .hidden()
            Button {
                showSettings.toggle()
            } label: {
                Image(systemName: "person.fill.badge.plus")
            }
        }
    }
    
    private var addButton: some View {
        // Keeps title centered and buttons fixed
        ZStack(alignment: .trailing){
            backButton
                .hidden()
            Button(action: {
                addButtonTapped.toggle()
            })
            {
                Label("", systemImage: "plus")
            }
            .frame(height: 45)
        }
    }
    
    private var cameraButton: some View {
        // Keep title centered and buttons fixed
        ZStack(alignment: .trailing){
            backButton
                .hidden()
            CameraNavButton()
                .frame(height: 45)
        }
    }
}
