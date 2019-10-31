//
//  ReportViewController.swift
//  save-our-species
//
//  Created by DSCommons on 10/23/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {

    @IBOutlet weak var ReportLabel: UILabel!

    let reportService = ReportService()
    var textDescription = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addReport(reportText: String) {
        reportService.addToList(reportDescription: reportText, completion: { (status) in
            if status {
                print("Status", status)
            }})
    }
    
    @IBAction func UploadButton(_ sender: UIButton) {
        addReport(reportText: textDescription)
    }
    @IBAction func LocationButton(_ sender: UIButton) {
    }
    @IBAction func descrField(_ sender: UITextField) {
        let textDescription = sender.text
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
