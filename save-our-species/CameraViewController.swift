//
//  CameraViewController.swift
//  save-our-species
//
//  Created by DSCommons on 11/8/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
    
    var longValue: Double? = 0
    var latValue: Double? = 0
    var descriptionText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //cameraToReport
        //Add naviagtion from login page back to home page by swiping to the right
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(sender:)))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
        print("LONG: ", longValue)
        print("LAT: ", latValue)
        print("DESCRIPTION: ",descriptionText)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sendPhoto"){
            let displayVC = segue.destination as! ReportConfirmationViewController

            displayVC.latValue = latValue
            displayVC.longValue = longValue
            displayVC.descriptionText = descriptionText
        }
    }

          
    //Handle swipes function
    @objc func handleSwipes(sender:UISwipeGestureRecognizer){
        performSegue(withIdentifier: "cameraToReport", sender: self)
    }
    
    @IBOutlet weak var cameraViewLabel: UILabel!
}
