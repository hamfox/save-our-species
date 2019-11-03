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
    
    func getList(completion: @escaping (Bool, [ReportModel]) -> ()){
        var reports = [ReportModel]()
        db.collection("reports").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(false, reports)
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                    completion(true, reports)
                }
        }
    }
    
    func addToList(reportDescription: String, completion: @escaping (Bool) -> ()) {
        var ref: DocumentReference? = nil

        ref = db.collection("reports").addDocument(data: [
            "description": reportDescription,
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


