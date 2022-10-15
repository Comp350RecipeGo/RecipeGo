//
//  PostRow.swift
//  RecipeGo!
//
//  Created by Matilda on 10/3/22.
//

import SwiftUI

// will display each individual post from list
    

struct PostRow: View {
    let post: Post
    
    @State private var showProfile = false;
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Button("Username") {
                    showProfile.toggle()
                }
                if showProfile {
                    Text("Navigates to user profile")
                        .foregroundColor(Color.blue)
                    .font(.subheadline)
                    .fontWeight(.medium)
                }
                Spacer() // space between name and time
                Text(post.timestamp.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
            }
            .foregroundColor(.gray)
            .clipped()
            Text(post.title)
                .font(.title3)
                .fontWeight(.semibold)
            Text(post.content)
                
        }
        
    }
   
    
    
}

// preview phone view 
struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            // passing our testPosts
            PostRow(post: Post.testPost)
        }
    }
}
