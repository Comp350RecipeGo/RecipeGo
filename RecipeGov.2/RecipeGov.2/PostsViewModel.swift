//
//  PostsViewModel.swift
//  RecipeGo!
//
//  Created by Matilda on 10/10/22.
//

import Foundation

@MainActor // only updates view from main thread 
/*
 Stores an array of posts
 */
class PostsViewModel: ObservableObject {
    @Published var posts = [Post.testPost]  // update view when post is posted
    
    // create makeAction
    func makeCreateAction() -> NewPostTemplate.CreateAction {
        return { [weak self] post in
            try await PostsRepository.create(post)
            self?.posts.insert(post, at: 0) // insert post at first array location
        }
    }
    
    
}

