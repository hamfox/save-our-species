//
//  RecentReportsViewController.swift
//  save-our-species
//
//  Created by DSCommons on 10/23/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit

class RecentReportsViewController: UIViewController {
    let reportsService = ReportService()

    override func viewDidLoad() {
        super.viewDidLoad()
        getAllReports()
    }
    
    func getAllReports() {
        reportsService.getList(completion: { (status, reports) in
            print(status)
        })
    }

    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
