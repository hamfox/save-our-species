//
//  ReportsModel.swift
//  save-our-species
//
//  Created by Paul Yakovlev on 10/26/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import Foundation
 
public struct ReportModelDescription {
    var reportDescription: String
 
    init(reportDescription: String){
        self.reportDescription = reportDescription
    }
}
 
class ReportModel {
    var report: ReportModelDescription
     
    init(report: ReportModelDescription) {
        self.report = ReportModelDescription(reportDescription: report.reportDescription)
    }
}
