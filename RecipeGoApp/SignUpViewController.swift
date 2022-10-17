//
//  SignUpViewController.swift
//  RecipeGo!
//
//  Created by Clio Ramirez on 10/11/22.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: NSObject {
    
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    
    
    func signUp() {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) {(authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error \(error?.localizedDescription)")
                return
            }
            
        }
        
    }

}
