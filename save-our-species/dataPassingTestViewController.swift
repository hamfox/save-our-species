//
//  dataPassingTestViewController.swift
//  save-our-species
//
//  Created by DSCommons on 11/7/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit

class dataPassingTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let longAsString = String(format:"%f", longValue!)
        longLabel.text = longAsString
        let latAsString = String(format:"%f", latValue!)
        latLabel.text = latAsString
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var longLabel: UILabel!
    @IBOutlet weak var latLabel: UILabel!
    
    var longValue: Double?
    var latValue: Double?
    

    @IBAction func nextButtonPressed(_ sender: UIButton) {
    }
}
