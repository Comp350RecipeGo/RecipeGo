//
//  LoginViewController.swift
//  RecipeGo!
//
//  Created by Clio Ramirez on 10/11/22.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: NSObject {
    
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    
    
    func login() {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] authResult, err in
            guard let strongSelf = self else {return}
            if let err = err {
                print(err.localizedDescription)
            }
            self!.checkUserInfo()
        }
    }
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
        }
    }

}
