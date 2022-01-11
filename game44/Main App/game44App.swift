//
//  game44App.swift
//  game44
//
//  Created by Leo Lopez on 10/1/22.
//

import SwiftUI

@main
struct game44App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
