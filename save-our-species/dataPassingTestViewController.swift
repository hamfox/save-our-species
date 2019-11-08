//
//  dataPassingTestViewController.swift
//  save-our-species
//
//  Created by DSCommons on 11/7/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit

class dataPassingTestViewController: UIViewController {
    
    @IBOutlet weak var longLabel: UILabel!
    @IBOutlet weak var latLabel: UILabel!
       
    var longValue: Double? = 0
    var latValue: Double? = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let longAsString = String(format:"%f", longValue!)
        longLabel.text = longAsString
        let latAsString = String(format:"%f", latValue!)
        latLabel.text = latAsString
        // Do any additional setup after loading the view.
        
        //dataPassingToMapView
        //Add naviagtion from login page back to home page by swiping to the right
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(sender:)))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
    }
    
    //Handle swipes function
       @objc func handleSwipes(sender:UISwipeGestureRecognizer){
           performSegue(withIdentifier: "dataPassingToMapView", sender: self)
       }
    

    @IBAction func nextButtonPressed(_ sender: UIButton) {
    }
}
