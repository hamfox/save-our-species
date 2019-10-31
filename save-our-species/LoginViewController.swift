//
//  LoginViewController.swift
//  save-our-species
//
//  Created by DSCommons on 10/23/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //Button
    @IBOutlet weak var ClientButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        //Make Button Round
        ClientButton.layer.cornerRadius = 10
        ClientButton.clipsToBounds = true

        // Do any additional setup after loading the view.
    }

    @IBAction func userField(_ sender: UITextField) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
