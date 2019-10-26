//
//  ReportService.swift
//  save-our-species
//
//  Created by Paul Yakovlev on 10/26/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import Foundation
import FirebaseFirestore
 
class ReportService {
    let db = Firestore.firestore()
    
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


