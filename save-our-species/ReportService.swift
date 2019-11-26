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
import FirebaseStorage
 
class ReportService {
    let db = Firestore.firestore()
    var urlString = ""
    
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
                        let imageURL = document.get("imageURL") as! String
                        let report = Report(description: description, latitude: latitude, longitude: longitude, reportTime: reportTime, imageURL: imageURL, image: nil ) as! Report
                        reports += [report]
                    }
                    completion(true,reports)
                }
        }
    }
    
    func addToList(report: Report, completion: @escaping (Bool) -> ()) {
        var ref: DocumentReference? = nil
        
        // upload report to Firestore
        ref = db.collection("reports").addDocument(data: [
            "description": report.description, "latitude": report.latitude, "longitude": report.longitude, "reportTime": report.reportTime, "imageURL": urlString
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                    completion(false)
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                    completion(true)
                }
        }
        
        // upload image to Firebase Storage and update Firestore with image reference URL
        // https://firebase.google.com/docs/firestore/manage-data/add-data
        let str = uploadImage(image: report.image!, timeStamp: report.reportTime) { (url) in
            let reportRef = self.db.collection("reports").document(ref!.documentID)

            reportRef.updateData([
                "imageURL": url
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
        }

    }
    
    // thank you internet stranger!
    // https://stackoverflow.com/questions/46152326/i-want-to-get-the-download-url-of-image-from-firebase-storage-ios-swift
    func uploadImage(image : UIImage, timeStamp: String,completion: @escaping ((String) -> Void)) {
        let storageRef = Storage.storage()
        var strURL = ""
        let storeImage = storageRef.reference().child("images/\(timeStamp).jpeg")

        if let uploadImageData = (image).pngData(){
            storeImage.putData(uploadImageData, metadata: nil, completion: { (metaData, error) in
                storeImage.downloadURL(completion: { (url, error) in
                    if let urlText = url?.absoluteString {
                        strURL = urlText
                        completion(strURL)
                    }
                })
            })
        }
    }
    
}


