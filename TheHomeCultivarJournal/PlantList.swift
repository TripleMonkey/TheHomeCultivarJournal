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
    @EnvironmentObject var dataVM: DataViewModel
    
    var body: some View {
        ZStack {
            if #available(iOS 16.0, *) {
                List {
                    // Loop through existing plant array and add each to list
                    ForEach(dataVM.savedPlants) { plant in
                        CustomNavLink(destination: PlantDetail(plant: plant)
                            .environmentObject(PlantViewModel(for: plant))
                            .customNavBarItems(
                                isParent: false,
                                title: plant.strainName,
                                backButtonTitle: "Plants",
                                cameraButtonIsVisible: true),
                                      label: {
                            PlantRow(currentPlant: plant)
                        })
                    }
                    .onDelete(perform: dataVM.deletePlant)
                    .background(.clear)
                }
                .scrollContentBackground(.hidden)
                .listStyle(.insetGrouped)
            } else {
                // Fallback on earlier versions
                List {
                    // Loop through existing plant array and add each to list
                    ForEach(dataVM.savedPlants) { plant in
                        CustomNavLink(destination: PlantDetail(plant: plant)
                            .customNavBarItems(
                                isParent: false,
                                title: plant.strainName,
                                backButtonTitle: "Plants",
                                cameraButtonIsVisible: true),
                                      label: {
                            PlantRow(currentPlant: plant)
                        })
                    }
                    .onDelete(perform: dataVM.deletePlant)
                }
                .listStyle(.insetGrouped)
            }
        }
        // Add empty list placeholder
        .emptyListButton(for: dataVM.savedPlants.count, message: "Tap to start your first grow", iconStringName: "pencil")
    }
    
    struct PlantList_Previews: PreviewProvider {
        @EnvironmentObject var listVM: DataViewModel
        
        static var previews: some View {
            PlantList()
                .environmentObject(DataViewModel.shared)
        }
    }
}
