//
//  ReportConfirmationViewController.swift
//  save-our-species
//
//  Created by Paul Yakovlev on 11/18/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit

class ReportConfirmationViewController: UIViewController {
    var longValue: Double? = 0
    var latValue: Double? = 0
    var descriptionText: String?

    @IBOutlet weak var descriptionField: UILabel!
    
    @IBOutlet weak var latitudeField: UILabel!
    
    @IBOutlet weak var longitudeField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let report = Report(description: descriptionText!, latitude: latValue!, longitude: longValue!)
        descriptionField.text = descriptionText
        let latAsString:String = String(format:"%f", latValue!)
        let longAsString:String = String(format:"%f", longValue!)
        latitudeField.text = latAsString
        longitudeField.text = longAsString
        
        
        //print(report?.description,report?.latitude,report?.longitude)
    }
}
