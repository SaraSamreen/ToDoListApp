//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Mac on 02/07/2026.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
