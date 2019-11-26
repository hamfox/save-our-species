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
        
        let str = uploadImage(image: report.image!, timeStamp: report.reportTime) { (url) in
            print("YO", url)
            
            let washingtonRef = self.db.collection("reports").document(ref!.documentID)

            // Set the "capital" field of the city 'DC'
            washingtonRef.updateData([
                "imageURL": url
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
            
        }

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
        
        print(ref!.documentID)
    }
    
    func uploadImage(image : UIImage, timeStamp: String,completion: @escaping ((String) -> Void)) {
        let storageRef = Storage.storage()
        var strURL = ""
        let storeImage = storageRef.reference().child("images/\(timeStamp).jpeg")

        if let uploadImageData = (image).pngData(){
            storeImage.putData(uploadImageData, metadata: nil, completion: { (metaData, error) in
                storeImage.downloadURL(completion: { (url, error) in
                    if let urlText = url?.absoluteString {

                        strURL = urlText
                        print("///////////tttttttt//////// \(strURL)   ////////")

                        completion(strURL)
                    }
                })
            })
        }
    }
}


