//
//  ContentView.swift
//  RecipeGo
//
//  Created by Amanda Dawley on 10/12/22.
//


import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    
    var body: some View {
        TabView(selection:$selection){
            Text("Feed")
                .font(.title)
                .tabItem {
                    VStack{
                        Image(systemName: "globe")
                        Text("Feed")
                    }
                }
                .tag(0)
            Profile()
                .font(.title)
                .tabItem {
                    VStack{
                        Image(systemName: "person")
                        Text("Profile")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
