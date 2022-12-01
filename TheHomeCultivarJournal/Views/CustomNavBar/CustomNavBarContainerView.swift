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
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(
                isParentNavBarView: isParentNavBarView,
                title: title,
                backButtonTitle: backButtonTitle,
                cameraButtonIsVisible: showCameraButton)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
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
    }
}

//struct CustomNavBarContainerView_Previews: PreviewProvider {
//
//    @ObservedObject var listVM = ListViewModel()
//
//    static var previews: some View {
//
//        CustomNavBarContainerView {
//            PlantList()
//                .customNavBarItems(isParent: false, title: "Preview", backButtonTitle: "Previous")
//        }
//        .preferredColorScheme(.dark)
//    }
//}
