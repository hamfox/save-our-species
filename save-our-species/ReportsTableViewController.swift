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
    var detailReport = Report(description: "", latitude: 0.0, longitude: 0.0, reportTime: "", imageURL: "", image: nil)
    var img : UIImage? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        getAllReports()
        
        //reportTableToClientView
        //Add naviagtion from login page back to home page by swiping to the right
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(sender:)))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
    }
    
    //Handle swipes function
      @objc func handleSwipes(sender:UISwipeGestureRecognizer){
          performSegue(withIdentifier: "reportTableToClientView", sender: self)
      }
    
    func getAllReports() {
        reportsService.getList(completion: { (status, reports) in
            for report in reports {
                // repeated code...not clean but works for now.
                // this sets each report image according to the ref url
                let url = URL(string: report.imageURL)
                self.getData(from: url!) { data, response, error in
                    guard let data = data, error == nil else { return }
                    print(response?.suggestedFilename ?? url!.lastPathComponent)
                    print("Download Finished")
                    DispatchQueue.main.async() {
                        report.image = UIImage(data: data)
                    }
                }
                self.reports.append(report)
            }
            // sort reports by timestamp with .compate operator on report dates converted to NSDate objects
            self.reports.sort { self.convertToDate(dateString: $0.reportTime).compare(self.convertToDate(dateString: $1.reportTime)) == .orderedDescending }
            self.tableView.reloadData()
        })
    }
    
    // Send report to be viewed in detail view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sendDetail"){
            let displayVC = segue.destination as! ReportDetailViewController
            let detailReport = reports[tableView.indexPathForSelectedRow!.row]

            displayVC.detailReport = detailReport
            
            print("TABLEVIEW: Description of selected cell:", detailReport.description)
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
        
        //cell.photoImageView.image = report.photo
        
        cell.timestampLabel.text = report.reportTime
        cell.descriptionPreviewLabel.text = report.description
        
        
        print("Download Started")
        let url = URL(string: report.imageURL)
        getData(from: url!) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url!.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                cell.photoImageView.image = UIImage(data: data)
            }
        }

        return cell
    }
    
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
