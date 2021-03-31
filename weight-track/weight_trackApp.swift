//
//  weight_trackApp.swift
//  weight-track
//
//  Created by George Alexandrov on 01.04.2021.
//

import SwiftUI

@main
struct weight_trackApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
