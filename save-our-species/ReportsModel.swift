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
    var reportTime: String
    var imageURL: String
    
    
    init?(description: String, latitude: Double, longitude: Double, reportTime: String, imageURL: String) {
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
        self.reportTime = reportTime
        self.imageURL = imageURL
    }
    
    func setDescription(description: String){
        self.description = description
    }
    
    func setLongitude(longitude: Double){
        self.longitude = longitude
    }
    
    func setLatitude(latitude: Double){
        self.latitude = latitude
    }
    
    func setReportTime(reportTime: String){
        self.reportTime = reportTime
    }
    
    func setImageURL(imageURL: String){
        self.imageURL = imageURL
    }
}

