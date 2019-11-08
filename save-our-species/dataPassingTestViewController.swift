//
//  dataPassingTestViewController.swift
//  save-our-species
//
//  Created by DSCommons on 11/7/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit
import MapKit

class dataPassingTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let longAsString = String(format:"%f", longValue!)
        longLabel.text = longAsString
        let latAsString = String(format:"%f", latValue!)
        latLabel.text = latAsString
        // Do any additional setup after loading the view.
    }
    
    var longValue: Double?
    var latValue: Double?
    
    
    @IBOutlet weak var longLabel: UILabel!
    @IBOutlet weak var latLabel: UILabel!
    
    
    @IBAction func getDirections(_ sender: Any) {
        let regionDistance: CLLocationDistance = 1000
        let latitude = latValue!
        let longitude = longValue!
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placeMark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placeMark)
        mapItem.name = "Stranding Location"
        mapItem.openInMaps(launchOptions: options)
        
    }
    
    
    
    
    

    @IBAction func nextButtonPressed(_ sender: UIButton) {
    }
}
