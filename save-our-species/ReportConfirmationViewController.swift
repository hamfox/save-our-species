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

    override func viewDidLoad() {
        super.viewDidLoad()
        let report = Report(description: descriptionText!, latitude: latValue!, longitude: longValue!)
        
        print(report?.description,report?.latitude,report?.longitude)
    }
}
