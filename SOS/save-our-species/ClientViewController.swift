//
//  ClientViewController.swift
//  save-our-species
//
//  Created by DSCommons on 10/23/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit
import FirebaseUI
import GoogleSignIn

class ClientViewController: UIViewController {
    
    //Buttons
    @IBOutlet weak var ReportButton: UIButton!
    @IBOutlet weak var ReportScreenButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Make buttons round
        ReportButton.layer.cornerRadius = 10
        ReportButton.clipsToBounds = true
        ReportScreenButton.layer.cornerRadius = 10
        ReportScreenButton.clipsToBounds = true
        logOutButton.layer.cornerRadius = 10
        logOutButton.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var ClientViewLabel: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func LogOutTapped(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        
        do {
            try Auth.auth().signOut()}
        catch let signOutError as NSError {
            print("Error signing out")
        }
        print("signing out..")
    }
    
}
