//
//  KineticTimerApp.swift
//  Shared
//
//  Created by Kin Wong on 28/7/21.
//

import SwiftUI

@main
struct KineticTimerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
