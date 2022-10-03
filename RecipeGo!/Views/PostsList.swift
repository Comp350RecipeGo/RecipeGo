//
//  PostsList.swift
//  RecipeGo!
//
//  Created by Matilda on 10/3/22.
//

import SwiftUI


// Post list will display list of post 
struct PostsList: View {
    private var posts = [Post.testPost, Post.testPost2]
    
    @State private var searchText = "" // initialize search 
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                if searchText.isEmpty || post.contains(searchText) {
                    PostRow(post: post)
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Posts")
        }
    }
}

// preview
struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        PostsList()
    }
}
