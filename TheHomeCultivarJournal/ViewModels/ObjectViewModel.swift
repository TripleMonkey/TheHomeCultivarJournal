//
//  ObjectViewModel.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 11/16/22.
//

import SwiftUI
import CoreData

final class ObjectViewModel: ObservableObject {
    
    @Published var strainName = ""
    @Published var growStage = ""
    @Published var growMedium = ""
    @Published var startDate = Date()
    @Published var ID: NSManagedObjectID?
    
    private init() {}
    
    init(for plant: Plant? = nil)  {
        guard let existingPlant = plant else { return }
        
        self.ID = existingPlant.objectID
        self.strainName = existingPlant.strainName
        self.growStage = existingPlant.growStage ?? "n/a"
        self.growMedium = existingPlant.growMedium ?? ""
        self.startDate = existingPlant.startDate ?? Date()
    }
    
    // Use on buttons to disable save actions when true
    func isValidObject() -> Bool {
        return strainName.isEmpty
    }
    
    
    
    func saveChanges() {
        var object: Plant
        if self.ID == nil {
            object = Plant(context: PersistenceController.shared.viewContext)
        } else {
            guard let id = ID else {
                return
            }
            object = PersistenceController.shared.viewContext.object(with: id) as! Plant
        }
        object.strainName = strainName
        object.startDate = startDate
        object.growStage = growStage
        object.growMedium = growMedium
        PersistenceController.shared.save()
    }
}
