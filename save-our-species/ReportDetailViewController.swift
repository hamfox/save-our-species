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
    
    @IBAction func getDirections(_ sender: Any) {
        let latitude = 36.9502
        let longitude = 122.0576
        
        let regionDistance:CLLocationDistance = 750;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Stranding Location"
        mapItem.openInMaps(launchOptions: options)
    }
    
    
    var detailReport = Report(description: "", latitude: 0.0, longitude: 0.0, reportTime: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getReadableLocation()
        DescriptionFieldLabel.text = detailReport?.description
        timeFieldLabel.text = detailReport?.reportTime
        
        print("DETAILVIEW: Received report description:",detailReport?.description)
    }
    
    func getReadableLocation() {
        let address = CLGeocoder.init()

        address.reverseGeocodeLocation(CLLocation.init(latitude: detailReport!.latitude, longitude:detailReport!.longitude)) { (placeMarks, error) in
            if error == nil{
                    if let placeMark = placeMarks?[0]{

                        print(placeMark)
                        print("THIS THE PLACE:",placeMark.name)
                        self.LocationFieldLabel.text = placeMark.name
                    }
            }
        }
    }
}
