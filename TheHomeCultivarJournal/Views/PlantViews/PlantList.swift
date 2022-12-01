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
    
    init() {
        UIScrollView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            Image("flowerCloseUp")
                .resizable()
                .ignoresSafeArea()
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
                }
                .scrollContentBackground(.hidden)
                .listStyle(.insetGrouped)
                
                // Add empty list placeholder
                .modifier(EmptyListPlaceholder(
                    listCount: listVM.savedPlants.count,
                    placeholder: Button(action: {
                        showSheet.toggle()
                    })
                    {
                        Label("Tap to start your first grow", systemImage: "pencil")
                            .padding()
                            
                    }
                        .background(.white)
                        .foregroundColor(.green)
                        .cornerRadius(20)
                        .shadow(radius: 0.9, x: -5, y: 5)))
                
                // Present new sheet when tapped
                .sheet(isPresented: $showSheet) {
                    EditPlantSheet()
                        .environmentObject(PlantViewModel())
                }
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
                .listRowBackground(Image("flowerCloseUp"))
                .listStyle(.insetGrouped)
                
                // Add empty list placeholder
                .modifier(EmptyListPlaceholder(
                    listCount: listVM.savedPlants.count,
                    placeholder: Button(action: {
                        showSheet.toggle()
                    })
                    {
                        Label("Tap to start your first grow", systemImage: "pencil")
                            .padding()
                            
                    }
                        .background(.white)
                        .foregroundColor(.green)
                        .cornerRadius(20)
                        .shadow(radius: 0.9, x: -5, y: 5)))
                
                // Present new sheet when tapped
                .sheet(isPresented: $showSheet) {
                    EditPlantSheet()
                        .environmentObject(PlantViewModel())
                }
            }
        }
    }
    
    struct PlantList_Previews: PreviewProvider {
        @EnvironmentObject var listVM: ListViewModel
        
        static var previews: some View {
            PlantList()
                .environmentObject(ListViewModel())
        }
    }
}
