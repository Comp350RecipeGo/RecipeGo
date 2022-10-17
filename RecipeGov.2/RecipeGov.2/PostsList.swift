//
//  PostsList.swift
//  RecipeGo!
//
//  Created by Matilda on 10/3/22.
//

/*
 showNewPostTemplate sets to true or false to pull up new post template
 // dismiss newPostTemplate when no longer needed in view
 */

import SwiftUI

// Post list will display list of post 
struct PostsList: View {
    
    @StateObject var viewModel = PostsViewModel()
    
    @State private var showNewPostTemplate = false
    @State private var searchText = ""
    
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                if searchText.isEmpty || post.contains(searchText) {
                    PostRow(post: post)
                }
            }
            .searchable(text: $searchText)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar {
                Button {
                    showNewPostTemplate = true
                } label: {
                    Label("New Post", systemImage: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $showNewPostTemplate) { // LOADS NEW POST TEMPLATE as a sheet
            NewPostTemplate(createAction: viewModel.makeCreateAction()) // call createAction
        }
    }
}

// preview
struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        PostsList()
    }
}
