//
//  LoginViewController.swift
//  save-our-species
//
//  Created by DSCommons on 10/23/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit
import FirebaseUI
import GoogleSignIn

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ClientButton.layer.cornerRadius = 10
        ClientButton.clipsToBounds = true
        
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()

          // TODO(developer) Configure the sign-in button look/feel
          // ...
        
        //Add naviagtion from login page back to home page by swiping to the right
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(sender:)))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
    }
    
    
    
    
    @IBAction func GoogleSignInTapped(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBOutlet weak var ClientButton: UIButton!
    
    @IBAction func userField(_ sender: UITextField) {
    }
    
    //Handle swipes function
    @objc func handleSwipes(sender:UISwipeGestureRecognizer){
        performSegue(withIdentifier: "loginToHome", sender: self)
    }
    
    
    
}
