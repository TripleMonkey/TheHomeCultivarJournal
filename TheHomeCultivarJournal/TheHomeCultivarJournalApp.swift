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
    let dataVM = DataViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                // Create '@Environment(\.managedObjectContext) var context' on view to access context
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
                // Create '@EnvironmentObject var dataVM: DataViewModel' on view to access/update Core Data
                .environmentObject(dataVM)
                
                //
                //.environment(\.colorScheme, DeviceSettingsViewModel.shared.darkMode ? .dark : .light)
        }
    }
}
