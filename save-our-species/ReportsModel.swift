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
    var photoURL: String
    var photo: UIImage?
    
    
    init?(description: String, latitude: Double, longitude: Double, reportTime: String, photoURL: String, photo: UIImage) {
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
        self.reportTime = reportTime
        self.photoURL = photoURL
        self.photo = photo
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
    
    func setPhotoURL(photoURL: String){
        self.photoURL = photoURL
    }
    
    func setPhoto(photo: UIImage){
        self.photo = photo
    }
}

