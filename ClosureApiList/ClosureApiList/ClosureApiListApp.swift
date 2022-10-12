//
//  ClosureApiListApp.swift
//  ClosureApiList
//
//  Created by Udaydeep on 08/09/22.
//

import SwiftUI

@main
struct ClosureApiListApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
