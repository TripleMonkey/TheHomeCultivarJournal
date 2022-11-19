//
//  TheHomeCultivarJournalApp.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 9/16/22.
//

import SwiftUI

@main
struct TheHomeCultivarJournalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
               .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}
