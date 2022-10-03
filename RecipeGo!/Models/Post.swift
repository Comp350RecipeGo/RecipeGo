//
//  Post .swift
//  RecipeGo!
//
//  Created by Matilda on 10/3/22.
//

import Foundation


struct Post: Identifiable {
    var title: String
    var content: String
    var authorName: String
    var timestamp = Date()
    var id = UUID() // unique identifier for each post
    
    /*
     This method checks the title, content, and author name to see whether they contain search string.
     */
    func contains(_ string: String) -> Bool {
        let properties = [title, content, authorName].map { $0.lowercased() }
        let query = string.lowercased() // not case sensetive
     
        let matches = properties.filter { $0.contains(query) }
        return !matches.isEmpty
    }
    
}



extension Post { // test post view 
    static let testPost = Post(
        title: "Test Post Title",
        content: "test description box...",
        authorName: "John Doe")
}

extension Post { // test post view
    static let testPost2 = Post(
        title: "Carbonara",
        content: "Recipe description: egg, bacon...",
        authorName: "Jane Doe")
}
