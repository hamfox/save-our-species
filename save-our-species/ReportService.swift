//
//  ReportService.swift
//  save-our-species
//
//  Created by Paul Yakovlev on 10/26/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
 
class ReportService {
    let db = Firestore.firestore()
    
    func getList(completion: @escaping (Bool, [Report]) -> ()){
        var reports = [Report]()
        
        db.collection("reports").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(false, reports)
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        let description = document.get("description") as! String
                        let latitude = document.get("latitude") as! Double
                        let longitude = document.get("longitude") as! Double
                        let reportTime = document.get("reportTime") as! String
                        let report = Report(description: description, latitude: latitude, longitude: longitude, reportTime: reportTime) as! Report
                        reports += [report]
                    }
                    completion(true,reports)
                }
        }
    }
    
    func addToList(report: Report, completion: @escaping (Bool) -> ()) {
        var ref: DocumentReference? = nil

        ref = db.collection("reports").addDocument(data: [
            "description": report.description, "latitude": report.latitude, "longitude": report.longitude, "reportTime": report.reportTime
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                    completion(false)
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                    completion(true)
                }
        }
    }
}


