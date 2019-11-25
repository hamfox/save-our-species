//
//  ReportConfirmationViewController.swift
//  save-our-species
//
//  Created by Paul Yakovlev on 11/18/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit

class ReportConfirmationViewController: UIViewController {
    let reportService = ReportService()

    var longValue: Double? = 0
    var latValue: Double? = 0
    var descriptionText: String? = ""
    var reportTime: String? = ""
    var image: UIImage? = UIImage(named: "redQuestionMark")
    var imageURL: String? = ""
    var report = Report(description: "", latitude: 0.0, longitude: 0.0, reportTime: "", imageURL: "", image: nil)

    @IBOutlet weak var descriptionField: UILabel!
    @IBOutlet weak var latitudeField: UILabel!
    @IBOutlet weak var longitudeField: UILabel!
    
    @IBAction func sendReportButtonTapped(_ sender: UIButton) {
        addReport(report: report!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        report = Report(description: descriptionText!, latitude: latValue!, longitude: longValue!, reportTime: reportTime!, imageURL: imageURL!, image: image!)
        descriptionField.text = descriptionText
        let latAsString:String = String(format:"%f", latValue!)
        let longAsString:String = String(format:"%f", longValue!)
        latitudeField.text = latAsString
        longitudeField.text = longAsString
        
        print(descriptionText)
        print("REPORTED AT: ",reportTime)
    }
    
    func addReport(report: Report) {
        reportService.addToList(report: report, completion: { (status) in
        if status {
            print("Status", status)
        }})
    }
}
