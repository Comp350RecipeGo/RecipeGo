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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(post.authorName)
                    .font(.subheadline)
                    .fontWeight(.medium)
                Spacer() // space between name and time
                Text(post.timestamp.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
            }
            .foregroundColor(.gray)
            Text(post.title)
                .font(.title3)
                .fontWeight(.semibold)
            Text(post.content)
        }
        .padding(.vertical)
    }
}

// preview phone view 
struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            // passing our testPosts
            PostRow(post: Post.testPost)
            PostRow(post: Post.testPost2)
        }
    }
}
