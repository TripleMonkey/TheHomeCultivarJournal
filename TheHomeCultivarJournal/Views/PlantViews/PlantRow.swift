//
//  PlantRow.swift
//  GrowHome
//
//  Created by Nigel Krajewski on 1/22/22.
//

import SwiftUI
import CloudKit
import CoreData

struct PlantRow: View {
    
    @StateObject var currentPlant: Plant
    
    var body: some View {
        HStack(alignment: .lastTextBaseline){
            VStack(alignment: .leading){
                Text(currentPlant.strainName)
                    .sfRoundFont(for: .title2)
                Text(dateToString(date: currentPlant.startDate ?? Date()))
                    .sfRoundFont(for: .caption)
            }
            Spacer()
            VStack {
                Text(currentPlant.growStage ?? "n/a")
                    .sfRoundFont(for: .title3)
                Text(currentPlant.growMedium ?? "n/a")
                    .sfRoundFont(for: .subheadline)
            }
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .offset(y: -20)
        }
        .padding()
    }
}

struct PlantRow_Previews: PreviewProvider {
    static var plant = Plant(entity: Plant.entity(), insertInto: PersistenceController.shared.container.viewContext)
    static var previews: some View {
        Group {
            PlantRow(currentPlant: Plant())
            PlantRow(currentPlant: Plant())
        }
    }
}
