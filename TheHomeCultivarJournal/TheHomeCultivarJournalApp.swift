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
    let listVM = ListViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                // Create '@Environment(\.managedObjectContext) var context' on view to access context
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
                // Create '@EnvironmentObject var listVM: ListViewModel' on view to access/update list
                .environmentObject(listVM)
                
                //
                //.environment(\.colorScheme, DeviceSettingsViewModel.shared.darkMode ? .dark : .light)
        }
    }
}
