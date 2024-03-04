//
//  RegisterLessonSwiftUIApp.swift
//  RegisterLessonSwiftUI
//
//  Created by macbook pro on 4.03.2024.
//

import SwiftUI

@main
struct RegisterLessonSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
