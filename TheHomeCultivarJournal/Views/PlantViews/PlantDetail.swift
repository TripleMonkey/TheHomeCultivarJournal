//
//  PlantDetail.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 10/17/22.
//

import SwiftUI
import CoreData

struct PlantDetail: View {
    
    @StateObject var currentPlant: Plant
    @State private var showSheet = false
    @EnvironmentObject var listVM: ListViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                CircleCrop(image: Image("budonpurplebg"))
                VStack(alignment: .leading) {
                    HStack(alignment: .lastTextBaseline) {
                        TextField("Strain",text: $currentPlant.strainName)
                            .foregroundColor(Color.purple)
                            .accessibilityLabel(currentPlant.strainName)
                            .sfRoundFont(for: .largeTitle)
                            .onSubmit {
                                listVM.saveData()
                            }
                            .customNavBarTitle(currentPlant.strainName)
                        Spacer()
                        Button("Edit"){
                            showSheet.toggle()
                        }
                        .sfRoundFont()
                        .sheet(isPresented: $showSheet) {
                            EditPlantSheet()
                                // Pass current Plant vm to sheet
                                .environmentObject(PlantViewModel(for: currentPlant))
                        }
                        .scenePadding()
                        .accessibilityLabel("Edit Button")
                    }
                    Group {
                        Text(dateToString(date: currentPlant.startDate ?? Date()))
                        Text(currentPlant.growStage ?? "n/a")
                        Text(currentPlant.growMedium ?? "n/a")
                    }
                    .sfRoundFont(for: .body)
                    //GridView()
                    
                }
            }
            .padding()
        }
    }
}

struct PlantDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        PlantDetail(currentPlant: Plant(entity: Plant.entity(), insertInto: PersistenceController.shared.container.viewContext))
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
