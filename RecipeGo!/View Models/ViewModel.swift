//
//  ViewModel.swift
//  RecipeGo!
//
//  Created by Matilda on 10/15/22.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func makePostsViewModel(filter: PostsViewModel.Filter = .all) -> PostsViewModel {
        return PostsViewModel(filter: filter, postsRepository: PostsRepository(user: user))
    }
}

#if DEBUG
extension ViewModel {
    static let preview = ViewModel(user: User.testUser)
}
#endif
