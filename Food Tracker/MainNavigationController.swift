//
//  MainNavigationController.swift
//  Food Tracker
//
//  Created by Mikio Nakata on 9/10/19.
//  Copyright © 2019 Mikio Nakata. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class MainNavigationController: UINavigationController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Non-existent sign out button
    // Don't forget about this.
    
    
    
    @IBAction func signOutButton(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            navigateToMainInterface()
  
        }
        catch {
            print(error)
        }
          
    }
    // change root vc back to login stage
    
    private func navigateToMainInterface() {
        //Instantiate new root view controller. (from welcome to login)
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! ViewController
        let navigationController = UINavigationController(rootViewController: newViewController)
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = navigationController
    
    }
}
