//
//  ReportViewController.swift
//  save-our-species
//
//  Created by DSCommons on 10/23/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {
    
    //Buttons
    @IBAction func UploadButton(_ sender: UIButton) {}
    
    //Buttons with images
    @IBAction func LocationButton(_ sender: UIButton) {}
    @IBAction func cameraButton(_ sender: UIButton) {}

    @IBOutlet weak var ReportLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    let reportService = ReportService()
    
    // Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addReport(reportText: String) {
        reportService.addToList(reportDescription: reportText, completion: { (status) in
            if status {
                print("Status", status)
                print("Text", reportText)
            }})
    }
    
    // Actions
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        print(sender.text!)
    }
    @IBAction func UploadButton(_ sender: UIButton) {
        addReport(reportText: descriptionTextField.text!)
    }
    @IBAction func LocationButton(_ sender: UIButton) {
    }
    @IBAction func descrField(_ sender: UITextField) {
        
    }
    @IBAction func cameraButton(_ sender: UIButton) {
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
