//
//  TabBarController.swift
//  RecipeGo!
//
//  Created by Clio Ramirez on 10/16/22.
//

import SwiftUI

struct TabBarController: View {
    @State var selectedIndex = 0
    
    let icons = ["house", "person"]
    
    var body: some View {
        VStack {
            ZStack {
                switch selectedIndex {
                case 0:
                    NavigationView {
                        VStack {
                            Text("Home")
                        }
                        .navigationTitle("Home")
                    }
                default:
                    NavigationView {
                        VStack {
                            Text("Profile")
                        }
                        .navigationTitle("Profile")
                    }
                }
            }
            
            Divider()
            HStack {
                ForEach(0..<2, id: \.self) { number in
                    Spacer()
                    Button(action: {
                        self.selectedIndex = number
        
                }, label: {
                    Image(systemName: icons[number])
                        .font(.system(size: 25, weight: .regular, design: .default))
                        .foregroundColor(.black)
                })
                Spacer()
}
            }
        }
    }
}
