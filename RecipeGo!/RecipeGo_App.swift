//
//  RecipeGo_App.swift
//  RecipeGo!
//
//  Created by Matilda on 10/2/22.
//

import SwiftUI
import Firebase

@main
struct RecipeGo_App: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            PostsList()
        }
    }
}
