//
//  APIController.swift
//  Recipe
//
//  Created by Ramtin Saremi on 10/11/22.
//

import Foundation

class APIController
{
    
    var users: [User] = []
    let baseURL = URL(string: "https://randomuser.me/api/?inc=name,email,dob,phone,picture&results=50")!
    
    typealias CompletionHandler = (Error?) -> Void
    
    func getUsers(completion: @escaping CompletionHandler = { _ in}){
        
        URLSession.shared.dataTask(with: baseURL){
            (data, _, error) in
            if let error = error{
                print("Error getting users: \(error)")
            }
            guard let data = data else{
                print("No data returned")
            completion(nil)
            return
            }
            
            do{
                let newUser = try JSONDecoder().decode(UserResult.self, from: data)
                print(newUser)
                self.users = newUser.results
                
            }
            catch{
                print("Error decoding \(error)")
                completion(error)
            }
            
            completion(nil)
            
            
        }.resume()
    }
}
