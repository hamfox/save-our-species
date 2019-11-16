//
//  ReportsModel.swift
//  save-our-species
//
//  Created by Paul Yakovlev on 10/26/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit
 
class Report {
    
    var description: String
    var latitude: Double
    var longitude: Double
    
    /*
    var timestamp: String
    var photo: UIImage?
    */
    
    
    init?(description: String, latitude: Double, longitude: Double ) {
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
    }
}

