//
//  ReportDetailViewController.swift
//  save-our-species
//
//  Created by Paul Yakovlev on 11/18/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ReportDetailViewController: UIViewController {

    @IBOutlet weak var UIImageLabel: UIImageView!
    @IBOutlet weak var timeFieldLabel: UILabel!
    @IBOutlet weak var DescriptionFieldLabel: UILabel!
    @IBOutlet weak var LocationFieldLabel: UILabel!
    
    var detailReport = Report(description: "", latitude: 0.0, longitude: 0.0)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getReadableLocation()
        DescriptionFieldLabel.text = detailReport?.description
        print("DETAILVIEW: Received report description:",detailReport?.description)
    }
    
    func getReadableLocation() {
        let address = CLGeocoder.init()
        address.reverseGeocodeLocation(CLLocation.init(latitude: detailReport!.latitude, longitude:detailReport!.longitude)) { (placeMarks, error) in
            if error == nil{
                    if let placeMark = placeMarks?[0]{
                        print(placeMark)
                        print("THIS THE PLACE:",placeMark.name)
                        
                    }
            }
        }
    }
    
}
