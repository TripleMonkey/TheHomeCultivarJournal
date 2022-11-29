//
//  ListViewModel.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 11/22/22.
//

import Foundation
import CoreData
import SwiftUI

final class ListViewModel: ObservableObject {
    
    @Environment(\.managedObjectContext) var context
    @Published var savedPlants: [Plant] = []
    
    
    init() {
        fetchPlants()
    }
    
    func fetchPlants() {
        let request = NSFetchRequest<Plant>(entityName: "Plant")
        do {
            savedPlants = try PersistenceController.shared.container.viewContext.fetch(request)
        } catch let error {
            print("ERROR FETCHING: \(error)")
        }
    }

    func saveData() {
        do {
            try PersistenceController.shared.container.viewContext.save()
            fetchPlants()
        } catch let error {
            print(" Error Saving: \(error)")
        }
    }
    
    func deletePlant(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedPlants[index]
        PersistenceController.shared.container.viewContext.delete(entity)
        saveData()
    }
}
