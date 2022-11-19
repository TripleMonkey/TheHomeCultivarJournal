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
    @Environment(\.presentationMode) var delete
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Plant.startDate, ascending: true)], animation: .default) private var fetchedPlants: FetchedResults<Plant>
    
    
    var body: some View {
        List {
            // Loop through existing plant array and add each to list
            ForEach(fetchedPlants) { plant in
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
            .onDelete(perform: { set in
                PersistenceController.shared.deleteItems(offsets: set, fetchedPlants: fetchedPlants)
                
            })
        }
        // Add empty list placeholder
        .modifier(EmptyListPlaceholder(
            listCount: fetchedPlants.count,
            placeholder: Button(action: {
                showSheet.toggle()
            })
            {
                Label("Tap to start your first grow", systemImage: "pencil")
            }))
        
        // Present new sheet when tapped
        .sheet(isPresented: $showSheet) {
            EditPlantSheet()
        }
    }

    struct PlantList_Previews: PreviewProvider {
        
        static var previews: some View {
            PlantList()
        }
    }
}
