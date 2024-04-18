//
//  ContentView.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 9/16/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    
    var body: some View {
        CustomNavView {
            ZStack {
                Color("BgFilterColor")
                    .ignoresSafeArea()
                    .opacity(0.5)
                Image("flowerCloseUp")
                    .resizable()
                    .ignoresSafeArea()
                    .opacity(0.75)
                PlantList() 
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(DataViewModel.shared)
        }
    }
}
