//
//  PlantList.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 10/15/22.
//

import SwiftUI
import CoreData


struct PlantList: View {
    
    @State private var showSheet = false
    @EnvironmentObject var listVM: ListViewModel
    
    var body: some View {
        List {
            // Loop through existing plant array and add each to list
            ForEach(listVM.savedPlants) { plant in
                CustomNavLink(destination: PlantDetail(currentPlant: plant)
                    .customNavBarItems(
                        isParent: false,
                        title: plant.strainName,
                        backButtonTitle: "Plants",
                        cameraButtonIsVisible: true),
                              label: {
                    PlantRow(currentPlant: plant)
                })
            }
            .onDelete(perform: listVM.deletePlant)
        }
        // Add empty list placeholder
        .modifier(EmptyListPlaceholder(
            listCount: listVM.savedPlants.count,
            placeholder: Button(action: {
                showSheet.toggle()
            })
            {
                Label("Tap to start your first grow", systemImage: "pencil")
            }))
        
        // Present new sheet when tapped
        .sheet(isPresented: $showSheet) {
            EditPlantSheet()
                .environmentObject(PlantViewModel())
        }
    }
    
    struct PlantList_Previews: PreviewProvider {
        
        static var previews: some View {
            PlantList()
        }
    }
}
