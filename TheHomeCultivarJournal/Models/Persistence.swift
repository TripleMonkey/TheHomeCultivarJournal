//
//  Persistence.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 9/16/22.
//

import CoreData
import SwiftUI

struct PersistenceController {
    
    static let shared = PersistenceController()
    let container: NSPersistentCloudKitContainer

//    var viewContext: NSManagedObjectContext {
//        container.viewContext
//    }
//
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "TheHomeCultivarJournal")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
         
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func save() {
        do {
            try container.viewContext.save()
        } catch {
            print("Failed to SAVE!: ", error.localizedDescription)
        }
    }
    
    func deleteItems(offsets: IndexSet, fetchedPlants: FetchedResults<Plant>) {
        withAnimation {
            offsets.map {fetchedPlants[$0] }.forEach(container.viewContext.delete)
            save()
        }
    }
}
