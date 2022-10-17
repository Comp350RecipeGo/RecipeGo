//
//  RecipeGoAppApp.swift
//  RecipeGoApp
//
//  Created by Clio Ramirez on 10/16/22.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct RecipeGoAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabBarController()
        }
    }
}
