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
    var reports = [Report]()
    var detailReport = Report(description: "", latitude: 0.0, longitude: 0.0, reportTime: "", imageURL: "", image: nil)
    var img : UIImage? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllReports()
    }
      
    
    func getAllReports() {
        reportsService.getList(completion: { (status, reports) in
            for report in reports {
                
                // Get the image for each cell
                let url = URL(string: report.imageURL)
                self.getData(from: url!) { data, response, error in
                    guard let data = data, error == nil else { return }
                    print(response?.suggestedFilename ?? url!.lastPathComponent)
                    print("Image download Finished")
                    DispatchQueue.main.async() {
                        report.image = UIImage(data: data)
                        self.tableView.reloadData()
                    }
                }
                self.reports.append(report)
            }
            
            // Sort reports by timestamp with .compare operator on report timestamps converted to NSDate objects
            self.reports.sort { self.convertToDate(dateString: $0.reportTime).compare(self.convertToDate(dateString: $1.reportTime)) == .orderedDescending }
            self.tableView.reloadData()
        })
    }
    
    // Send report object via segue to ReportDetailView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sendDetail"){
            let displayVC = segue.destination as! ReportDetailViewController
            let detailReport = reports[tableView.indexPathForSelectedRow!.row]

            displayVC.detailReport = detailReport
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reports.count
    }
    
    // Populate table with cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ReportTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ReportTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ReportsTableViewCell.")
        }
        
        let report = reports[indexPath.row]
        
        cell.photoImageView.image = report.image
        cell.timestampLabel.text = report.reportTime
        cell.descriptionPreviewLabel.text = report.description

        return cell
    }
    
    // Convert timestamp to Date object
    func convertToDate(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let date = dateFormatter.date(from:dateString)!
        return date as Date
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
