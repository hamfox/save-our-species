//
//  ViewController.swift
//  save-our-species
//
//  Created by Paul Yakovlev on 10/23/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit
import GoogleSignIn
import FirebaseUI

class ViewController: UIViewController {
    //Labels
    @IBOutlet weak var HomeLabel: UILabel!
    
    //Buttons
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var ReportButton: UIButton!
    
    //Actions
    @IBAction func LoginTapped(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signIn()
        
        Auth.auth().addStateDidChangeListener{ auth, user in
            if user != nil {
                print("signed in with \(Auth.auth().currentUser?.uid)")
                self.performSegue(withIdentifier: "showClientView", sender: self)
            } else {
                print("Not signed in")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        //make button rounded
        //this code doesn't make the borders rounded
        LoginButton.layer.cornerRadius = 10
        LoginButton.clipsToBounds = true
        
        ReportButton.layer.cornerRadius = 10
        ReportButton.clipsToBounds = true
        
    }
}

