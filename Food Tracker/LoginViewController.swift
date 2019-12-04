//
//  LoginViewController.swift
//  Food Tracker
//
//  Created by Mikio Nakata on 9/10/19.
//  Copyright © 2019 Mikio Nakata. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    // validate text fields function

//func validateFields() -> String? {
//
//    //check that all fields are filled in
//    if usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//        passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
//
//        return "Please return all fields."
//
//    }
    

    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    
    
    @IBAction func loginTapped(_ sender: Any) {
        //comment out when ready
        //let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController)
        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainNavigationController")
        
        // swap out the root viewcontroller
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
        
        
        return
        //until here <--
        

        
        //validate text fields (check if there are any errors in the text fields)
        
        //create cleaned versions of the email, password text
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //sign in the user
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            if error != nil {
                //Couldn't log in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
                
            } else {
                //transition to home vc
                let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController)
                
                // swap out the root viewcontroller
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
        
    
    }
    

    
    @IBAction func signupTapped(_ sender: Any) {
        
    }
    
    
    

        
    
    
    //get access to our storyboard
    private func navigateToMainInterface() {
        
        //Instantiate new root view controller. (from login to welcome)
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MainNavigationController") as! ViewController
        let navigationController = UINavigationController(rootViewController: newViewController)
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = navigationController
        
        
        
        
//        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//
//        guard let mainNavigationVC = mainStoryboard.instantiateViewController(withIdentifier: "MainNavigationController") as? MainNavigationController else {
//            return
//        }
//
//        present(mainNavigationVC, animated: true, completion: nil)
        
    }
    
    
}
