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
    @ObservedObject var plantViewModel: ObjectViewModel
    
    
    init() {
        plantViewModel = ObjectViewModel()
    }
    
    init(id: NSManagedObjectID) {
        let plant = PersistenceController.shared.viewContext.object(with: id)
        self.plantViewModel = ObjectViewModel(for: plant as? Plant)
    }
    
    var body: some View {
        VStack
        {
            HStack(alignment: .top) {
                cancelButton
                Spacer()
                saveButton
            }
            Form {
                Section(header: Text(plantViewModel.strainName)
                    .foregroundColor(.purple)
                    .fontWeight(.thin)
                    .sfRoundFont(for: .title3))
                {
                    TextField("Strain",
                              text: $plantViewModel.strainName
                    )
                    TextField("Current Stage",
                              text: $plantViewModel.growStage
                    )
                    DatePicker("Stage started",
                               selection: $plantViewModel.startDate,
                               displayedComponents: .date
                    )
                }
                .sfRoundFont()
                .customNavBarTitle(plantViewModel.strainName)
            }
        }
    }
}


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
            plantViewModel.saveChanges()
            dismiss()
        } label: {
            Text("Save")
                .fontWeight(.bold)
        }
        .disabled(plantViewModel.isValidObject())
        .sfRoundFont(for: .subheadline)
        .padding()
    }
}

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
