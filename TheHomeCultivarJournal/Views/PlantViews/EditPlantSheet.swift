//
//  EditPlantSheet.swift
//  GrowHome
//
//  Created by Nigel Krajewski on 1/21/22.
//

import SwiftUI
import Foundation
import CloudKit
import CoreData

struct EditPlantSheet: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var plantVM: PlantViewModel
    @EnvironmentObject var listVM: ListViewModel
    
    
    var body: some View {
        VStack
        {
            HStack(alignment: .top) {
                cancelButton
                Spacer()
                saveButton
            }
            Form {
                Section(header: Text(plantVM.strainName)
                    .foregroundColor(.purple)
                    .fontWeight(.thin)
                    .sfRoundFont(for: .title3))
                {
                    TextField("Strain",
                              text: $plantVM.strainName
                    )
                    TextField("Current Stage",
                              text: $plantVM.growStage
                    )
                    DatePicker("Stage started",
                               selection: $plantVM.startDate,
                               displayedComponents: .date
                    )
                }
                .sfRoundFont()
            }
        }
    }
}

//MARK: Buttons

extension EditPlantSheet {
    
    private var cancelButton: some View {
        Button("Cancel")
        {
            dismiss()
        }
        .sfRoundFont(for: .subheadline)
        .padding()
    }
    
    private var saveButton: some View {
        
        Button {
            plantVM.updatePlant()
            listVM.saveData()
            dismiss()
        } label: {
            Text("Save")
                .fontWeight(.bold)
        }
        .disabled(!plantVM.isValidObject())
        .sfRoundFont(for: .subheadline)
        .padding()
    }
}

