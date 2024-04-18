//
//  ListViewModel.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 11/22/22.
//

import Foundation
import CoreData
import SwiftUI

final class DataViewModel: ObservableObject {
    
    // MARK: published variables
    @Published var currentPlant: Plant?
    @Published var currentGrowSpace: GrowSpace?
    @Published var currentImageAsset: ImageAsset?
    @Published var currentCareNote: CareNote?
    
    @Published var savedPlants: [Plant] = []
    
    // MARK: Singleton Pattern
    static var shared = DataViewModel()
    private init() {
       fetchPlants()
    }
    
    // MARK: Core Data functions
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
            if PersistenceController.shared.container.viewContext.hasChanges {
                try PersistenceController.shared.container.viewContext.save()
                fetchPlants()
            }
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
    
    // MARK: Functions to keep reference objects current
    func addImage(to plant: Plant) {
        guard let image = currentImageAsset else { return }
            plant.addToImageAssets(image)
            currentPlant = plant
    }
    func updateGrowSpace(growSpace: GrowSpace) {
        currentGrowSpace = growSpace
    }
    func updateImageAsset(imageAsset: ImageAsset) {
        currentImageAsset = imageAsset
    }
    func updateCareNote(careNote: CareNote) {
        currentCareNote = careNote
    }
}
