//
//  ReportsTableViewController.swift
//  save-our-species
//
//  Created by Paul Yakovlev on 11/3/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit

class ReportsTableViewController: UITableViewController {
    let reportsService = ReportService()

    // MARK: Properties
    var reports = [Report]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleReports()
        getAllReports()
    }

    // MARK: - Table view data source
    
    func loadSampleReports() {
        let photo1 = UIImage(named: "gerald.jpg")
        
        guard let report1 = Report(description: "foobar", timestamp: "420", photo: photo1 ) else {
            fatalError("Unable to instantiate report1")
        }
        
        reports += [report1]

    }
    
    func getAllReports() {
        reportsService.getList(completion: { (status, reports) in
            print(status)
        })
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reports.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ReportTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ReportTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ReportsTableViewCell.")
        }
        
        let report = reports[indexPath.row]
        
        cell.timestampLabel.text = report.timestamp
        cell.photoImageView.image = report.photo
        cell.descriptionPreviewLabel.text = report.description

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
