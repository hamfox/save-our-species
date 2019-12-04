//
//  ReportConfirmationViewController.swift
//  save-our-species
//
//  Created by Paul Yakovlev on 11/18/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ReportConfirmationViewController: UIViewController {
    
    let reportService = ReportService()
    var longValue: Double? = 0.0
    var latValue: Double? = 0.0
    var descriptionText: String? = ""
    var reportTime: String? = ""
    var image: UIImage? = UIImage(named: "greySealLogo")
    var imageURL: String? = ""
    var report = Report(description: "", latitude: 0.0, longitude: 0.0, reportTime: "", imageURL: "", image: nil)
    
    @IBOutlet weak var descriptionField: UILabel!
    @IBOutlet weak var latitudeField: UILabel!
    @IBOutlet weak var longitudeField: UILabel!
    @IBOutlet weak var strandingImageView: UIImageView!
    @IBOutlet weak var locationField: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        report = Report(description: descriptionText!, latitude: latValue!, longitude: longValue!, reportTime: reportTime!, imageURL: imageURL!, image: image!)
        descriptionField.text = descriptionText
        let latAsString:String = String(format:"%f", latValue!)
        let longAsString:String = String(format:"%f", longValue!)
        latitudeField.text = latAsString
        longitudeField.text = longAsString
        strandingImageView.image = image
        getReadableLocation()
    }
    
    
    @IBAction func sendReportButtonTapped(_ sender: UIButton) {
        addReport(report: report!)
    }

    
    func getReadableLocation() {
        let address = CLGeocoder.init()
        address.reverseGeocodeLocation(CLLocation.init(latitude: report!.latitude, longitude: report!.longitude)) { (placeMarks, error) in
            if error == nil{
                    if let placeMark = placeMarks?[0]{
                        self.locationField.text = placeMark.name
                    }
            }
        }
    }
    
    
    func addReport(report: Report) {
        reportService.addToList(report: report, completion: { (status) in
        if status {
            print("Status", status)
        }})
    }
}
