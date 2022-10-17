//
//  RecipeGoApp.swift
//  RecipeGo
//
//  Created by Amanda Dawley on 10/12/22.
//

import SwiftUI
import FirebaseCore

@main
struct RecipeGoApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
