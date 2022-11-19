//
//  CustomNavBarPreferenceKeys.swift
//  GrowHome
//
//  Created by Nigel Krajewski on 4/1/22.
//

import Foundation
import SwiftUI


//MARK: PREFERENCE KEYS
struct CustomNavBarIsParentPrefernceKey: PreferenceKey {
    static var defaultValue: Bool = true
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

struct CustomNavBarTitlePrefernceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

struct CustomNavBarBackButtonTitlePrefernceKey: PreferenceKey {
    static var defaultValue: String = "Plant"
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

struct CustomNavBarCameraButtonPreferenceKey: PreferenceKey {
    static var defaultValue: Bool = false

    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
    
}


//MARK: VIEW FUNCTIONS
extension View {
    
    func customNavBarIsParent(_ isParent: Bool) -> some View {
        preference(key: CustomNavBarIsParentPrefernceKey.self, value: isParent)
    }
    
    func customNavBarTitle(_ title: String) -> some View {
        preference(key: CustomNavBarTitlePrefernceKey.self, value: title)
    }
    
    func customNavBarBackButtonTitle(_ backButtonTitle: String) -> some View {
        preference(key: CustomNavBarBackButtonTitlePrefernceKey.self, value: backButtonTitle)
    }
    
    func customNavBarCameraButtonVisible(_ cameraButtonIsVisible: Bool) -> some View {
        preference(key: CustomNavBarCameraButtonPreferenceKey.self, value: cameraButtonIsVisible)
    }
    
    func customNavBarItems(isParent: Bool = true, title: String = "", backButtonTitle: String = "", cameraButtonIsVisible: Bool = false) -> some View {
        self
            .customNavBarIsParent(isParent)
            .customNavBarTitle(title)
            .customNavBarBackButtonTitle(backButtonTitle)
            .customNavBarCameraButtonVisible(cameraButtonIsVisible)
        
    }
}

