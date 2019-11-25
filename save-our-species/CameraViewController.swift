//
//  CameraViewController.swift
//  save-our-species
//
//  Created by DSCommons on 11/8/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var longValue: Double? = 0
    var latValue: Double? = 0
    var descriptionText: String?
    var reportTime: String?

    @IBOutlet weak var cameraViewLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBAction func buttonNext(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(sender:)))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(sender:)))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
        reportTime = getCurrentTime()
        
        print("LONG: ", longValue)
        print("LAT: ", latValue)
        print("DESCRIPTION: ",descriptionText)
        print("TIME: ", reportTime)
    }
    
    
    @objc func handleSwipes(sender:UISwipeGestureRecognizer){
        switch sender.direction.rawValue{
            case 1:
                performSegue(withIdentifier: "goNext", sender: self)
                print("swipe left")
            case 2:
                performSegue(withIdentifier: "cameraToReport", sender: self)
            default:
                break
        }
    }

    
    //Source: Apple Food Tracker Tutorial
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
           
        // photoImageView displays the selected image
        photoImageView.image = selectedImage
        

        // Dismiss the picker once user chooses photo
        dismiss(animated: true, completion: nil)
    }
    
  
    //Tap gesture goes to this funcion
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //UIImgePickerController is a view controller tha allows user to pick photo from library
        let imagePickerController = UIImagePickerController()
        
        //allow photos to be picked
        //source type is photoLibrary because we are using photo lib instead of camera
        imagePickerController.sourceType = .photoLibrary
        
        //ViewController is notified when user picks an image
        imagePickerController.delegate = self

        present(imagePickerController, animated: true, completion: nil)
    }
  
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sendPhoto"){
            let displayVC = segue.destination as! ReportConfirmationViewController

            displayVC.latValue = latValue
            displayVC.longValue = longValue
            displayVC.descriptionText = descriptionText
            displayVC.reportTime = reportTime
        }
    }
    
    func getCurrentTime () -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy_MM_dd_hh_mm_ss"
        return (formatter.string(from: Date()) as NSString) as String
    }
}
