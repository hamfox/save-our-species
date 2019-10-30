//
//  ViewController.swift
//  save-our-species
//
//  Created by Paul Yakovlev on 10/23/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Labels
    @IBOutlet weak var HomeLabel: UILabel!
    //Buttons
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var ReportButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //make button rounded
        //this code doesn't make the borders rounded
        LoginButton.layer.cornerRadius = 20
        LoginButton.clipsToBounds = true
        
        ReportButton.layer.cornerRadius = 20
        ReportButton.clipsToBounds = true
        
        
        
        
        
        
    }
}

