//
//  RecipeGov_2App.swift
//  RecipeGov.2
//
//  Created by Matilda on 10/16/22.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore

@main
struct RecipeGov_2App: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            PostsList()
        }
    }
}
