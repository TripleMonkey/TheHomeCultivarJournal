//
//  CustomNavLink.swift
//  GrowHome
//
//  Created by Nigel Krajewski on 3/30/22.
//

import SwiftUI

struct CustomNavLink<Destination:View, Label:View>: View {
    
    let destination: Destination
    let label: Label
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        NavigationLink(
            destination:
                CustomNavBarContainerView(content: {
                    destination
                })
                // Hide default nav bar to show only custom nav bar in destination
                .navigationBarHidden(true),
            label: {
                label
            })
    }
}

struct CustomNavLink_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView {
            CustomNavLink(
                destination: Text("Destination")) {
                    HStack {
                        Text("GO")
                    }
                    Image(systemName: "chevron.right")
                }
        }
    }
}
