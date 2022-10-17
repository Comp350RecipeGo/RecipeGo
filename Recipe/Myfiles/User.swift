//
//  User.swift
//  Recipe
//
//  Created by Ramtin Saremi on 10/11/22.
//

import Foundation

struct UserResult : Decodable{
    let results: [User]
    
    
}

struct User: Decodable{
    let name: Name
    let email: String
    let dob: Dob
    let phone: String
    
}

struct Name: Decodable
{
    var first: String
    var last: String
}

struct Dob: Decodable
{
    var age: Int
    var date: String
}
