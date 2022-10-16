//
//  Post .swift
//  RecipeGo!
//
//  Created by Matilda on 10/3/22.

/*
 Contains user post defintion
 Search capability for feed
 and 2 test posts
 */

import Foundation

// user post definition
struct Post: Identifiable, Codable {
    var title: String
    var content: String
    var authorName: String
    //var author: User
    var timestamp = Date()
    var id = UUID() // every post will have a unique UUID
    var imageURL: URL?

    
    /*
     Search function let's you search the feed for author name, content or, used in PostsList
     post title
     */
    func contains(_ string: String) -> Bool {
        let properties = [title, content, authorName].map { $0.lowercased() }
        let query = string.lowercased() // not case sensetive
        let matches = properties.filter { $0.contains(query) }
        return !matches.isEmpty
    }
    
}

//extension Post: Codable {
//    enum CodingKeys: CodingKey {
//        case title, content, author, imageURL, timestamp, id
//    }
//}


// Hardcoded test post for feed
extension Post {
    static let testPost = Post(
        title: "My Recipe",
        content: "description box...",
        authorName: "John Doe")
}

// Hardcoded test post 2 for feed
extension Post {
    static let testPost2 = Post(
        title: "Carbonara",
        content: "Delicious!",
        authorName: "Jane Doe")
}
