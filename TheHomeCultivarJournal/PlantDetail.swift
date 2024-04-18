//
//  PlantDetail.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 10/17/22.
//

import SwiftUI
import CoreData

struct PlantDetail: View {
    
    
    @EnvironmentObject var plantVM: PlantViewModel
    @EnvironmentObject var listVM: DataViewModel
    
    @State private var showSheet = false
    //@State private var currentPlant: Plant
    
    init(plant: Plant) {
        plantVM.currentPlant = plant
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center) {
                CircleCrop(image: plantVM.headlineImage)
                VStack(alignment: .leading) {
                    HStack(alignment: .lastTextBaseline) {
                        TextField("Strain",text: $plantVM.strainName)
                            .foregroundColor(Color.purple)
                            .accessibilityLabel(plantVM.strainName)
                            .sfRoundFont(for: .largeTitle)
                            .onSubmit {
                                plantVM.updatePlant()
                                listVM.saveData()
                            }
                            .customNavBarTitle(plantVM.strainName)
                        Spacer()
                        Button("Edit"){
                            showSheet.toggle()
                        }
                        .sfRoundFont()
                        .sheet(isPresented: $showSheet) {
                            EditPlantSheet()
                                // Pass current Plant vm to sheet
                                .environmentObject(PlantViewModel(for: plantVM.currentPlant))
                        }
                        .scenePadding()
                        .accessibilityLabel("Edit Button")
                    }
                    Group {
                        Text(dateToString(date: plantVM.startDate))
                        Text(plantVM.growStage)
                        Text(plantVM.growMedium)
                    }
                    .sfRoundFont(for: .body)
                    
                    Section(content: {
                        if !plantVM.imageAssets.isEmpty {
                            ImageGridView(images: plantVM.imageAssets)
                        }
                    }, header: {
                        Text("Images")
                    })
                }
            }
            .padding()
            .accentColor(/*@START_MENU_TOKEN@*/.purple/*@END_MENU_TOKEN@*/)
        }
        
        
    }
}

struct PlantDetail_Previews: PreviewProvider {

    static var previews: some View {
        PlantDetail(plant: Plant(entity: Plant.entity(), insertInto: PersistenceController.shared.container.viewContext))
    }
}


// Date Format for views
extension View {
    
    func stringToDate(string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yy h:mm a"
        return formatter.date(from: string) ?? Date()
    }
    
    func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yy h:mm a"
        return formatter.string(from: date)
    }
}
