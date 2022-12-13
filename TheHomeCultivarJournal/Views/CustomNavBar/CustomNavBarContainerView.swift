//
//  CustomNavBarContainerView.swift
//  GrowHome
//
//  Created by Nigel Krajewski on 3/29/22.
//

import SwiftUI


struct CustomNavBarContainerView<Content: View>: View{
    
    
    let content: Content
    @State private var isParentNavBarView: Bool = false
    @State private var title: String = "Container Title"
    @State private var backButtonTitle: String = "default"
    @State private var showCameraButton: Bool = true
    @State private var showSettingsView: Bool = false
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(
                showSettings: $showSettingsView,
                isParentNavBarView: isParentNavBarView,
                title: title,
                backButtonTitle: backButtonTitle,
                cameraButtonIsVisible: showCameraButton)
            ZStack {
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                DeviceSettingsView(isShown: $showSettingsView)
            }
        }
        .onPreferenceChange(CustomNavBarIsParentPrefernceKey.self, perform: {
            value in
            self.isParentNavBarView = value
        })
        .onPreferenceChange(CustomNavBarTitlePrefernceKey.self, perform: {
            value in
            self.title = value
        })
        .onPreferenceChange(CustomNavBarBackButtonTitlePrefernceKey.self, perform: {
            value in
            self.backButtonTitle = value
        })
        .onPreferenceChange(CustomNavBarSettingsShownPrefernceKey.self, perform: { value in
            self.showSettingsView = value
        })
    }
}
