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
    var timestamp: String
    var photo: UIImage?
     
    init?(description: String, timestamp: String, photo: UIImage?) {
        self.description = description
        self.timestamp = timestamp
        self.photo = photo
    }
}
