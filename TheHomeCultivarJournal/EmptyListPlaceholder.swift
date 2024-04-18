//
//  EmptyListPlaceholder.swift
//  GrowHome
//
//  Created by Nigel Krajewski on 1/24/22.
//

import SwiftUI
// Struct to add placeholder to list view when empty
struct EmptyListPlaceholder: ViewModifier {
    
    let listCount: Int
    let message: String
    var iconStringName: String
    @State var tapped: Bool = false
    
    
    @ViewBuilder
    func body(content: Content) -> some View {
        if listCount > 0 {
            // Show list content
            content
        } else {
            // Show button to add first item
            emptyListButton
        }
    }
    
    var emptyListButton: some View {
        Button(action: {
            tapped.toggle()
        })
        {
            Label(message, systemImage: iconStringName)
                .padding()
                .sfRoundFont(for: .headline)
                .background(Color("NavBgColor"))
                .foregroundColor(.accentColor)
                .cornerRadius(15)
                .shadow(radius: 1.0, x: -5, y: 5)
        }
        .sheet(isPresented: $tapped) {
            NewPlantSheet()
        }
    }
}

extension View {
    func emptyListButton(for listCount: Int,
                         message: String = "Tap to get started",
                         iconStringName: String = "plus") -> some View
    {
        return modifier(EmptyListPlaceholder(listCount: listCount, message: message, iconStringName: iconStringName))
    }
}
