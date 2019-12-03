//
//  ReportViewController.swift
//  save-our-species
//
//  Created by DSCommons on 10/23/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {
    
    @IBOutlet weak var DirectionLabel: UILabel!
    @IBOutlet weak var RepDescrpBox: UITextView!
    @IBOutlet weak var ReportLabel: UILabel!
    
    let reportService = ReportService()
    var descriptionText: String?
    var longValue: Double? = 0
    var latValue: Double? = 0
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        descriptionText = RepDescrpBox.text!
    }
    
    
    func dismissKeyboard(RepDescrpBox: UITextView) -> Bool {
        RepDescrpBox.resignFirstResponder()
        return true
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sendDescription"){
            let displayVC = segue.destination as! CameraViewController

            displayVC.latValue = latValue
            displayVC.longValue = longValue
            displayVC.descriptionText = descriptionText
        }
    }
    

    @objc func tapDone(sender: Any) {
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.RepDescrpBox.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))

        print("LONG: ", longValue)
        print("LAT:", latValue)

        RepDescrpBox.layer.borderColor=UIColor.brown.cgColor
        
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
               RepDescrpBox.layer.borderWidth = 1.5
               RepDescrpBox.layer.borderColor = borderColor.cgColor
               RepDescrpBox.layer.cornerRadius = 5.0
        
        //Add naviagtion from login page back to home page by swiping to the right
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(sender:)))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
       
    }
    
    
    // Handle swipes
    @objc func handleSwipes(sender:UISwipeGestureRecognizer){
        performSegue(withIdentifier: "reportToDataPassing", sender: self)
    }
}
