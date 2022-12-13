//
//  CustomNavView.swift
//  GrowHome
//
//  Created by Nigel Krajewski on 3/30/22.
//

import SwiftUI

struct CustomNavView<Content:View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            CustomNavBarContainerView {
                content
                    .opacity(0.95)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CustomNavView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView {
            Color.red.opacity(0.3).ignoresSafeArea()
        }
    }
}
