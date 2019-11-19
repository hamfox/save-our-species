//
//  ReportDetailViewController.swift
//  save-our-species
//
//  Created by Paul Yakovlev on 11/18/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit

class ReportDetailViewController: UIViewController {

    @IBOutlet weak var UIImageLabel: UIImageView!
    @IBOutlet weak var timeFieldLabel: UILabel!
    @IBOutlet weak var DescriptionFieldLabel: UILabel!
    @IBOutlet weak var LocationFieldLabel: UILabel!
    
    var detailReport = Report(description: "", latitude: 0.0, longitude: 0.0)
    var message : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DETAILVIEW: Received report description:",detailReport?.description)
    }
}
