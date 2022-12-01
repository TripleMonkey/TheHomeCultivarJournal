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
            PlantList()
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(ListViewModel())
        }
    }
}
