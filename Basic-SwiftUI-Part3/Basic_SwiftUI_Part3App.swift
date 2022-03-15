//
//  Basic_SwiftUI_Part3App.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 15/03/22.
//

import SwiftUI

@main
struct Basic_SwiftUI_Part3App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
