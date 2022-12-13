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
        ZStack {
            if #available(iOS 16.0, *) {
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
                    .background(.clear)
                }
                .scrollContentBackground(.hidden)
                .listStyle(.insetGrouped)
            } else {
                // Fallback on earlier versions
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
                .listStyle(.insetGrouped)
            }
        }
        // Add empty list placeholder
        .emptyListButton(for: listVM.savedPlants.count, message: "Tap to start your first grow", iconStringName: "pencil")
    }
    
    struct PlantList_Previews: PreviewProvider {
        @EnvironmentObject var listVM: ListViewModel
        
        static var previews: some View {
            PlantList()
                .environmentObject(ListViewModel())
        }
    }
}
