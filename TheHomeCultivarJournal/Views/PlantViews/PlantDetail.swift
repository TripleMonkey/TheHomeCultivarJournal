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
                        Spacer()
                        Button("Edit"){
                            showSheet.toggle()
                        }
                        .sfRoundFont()
                        .sheet(isPresented: $showSheet) {
                            EditPlantSheet(id: currentPlant.objectID)
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
                }
                .customNavBarTitle(currentPlant.strainName)
            }
            .padding()
        }
    }
}

struct PlantDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        PlantDetail(currentPlant: Plant(entity: Plant.entity(), insertInto: PersistenceController.shared.viewContext))
    }
}

