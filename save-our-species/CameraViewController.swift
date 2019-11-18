//
//  CameraViewController.swift
//  save-our-species
//
//  Created by DSCommons on 11/8/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    
    
    @IBOutlet weak var cameraViewLabel: UILabel!
    @IBAction func buttonNext(_ sender: Any) {
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

              
              //cameraToReport
              //Add naviagtion from login page back to home page by swiping to the right
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(sender:)))
                          leftSwipe.direction = .left
                          view.addGestureRecognizer(leftSwipe)
        
        
                     let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(sender:)))
                     rightSwipe.direction = .right
                     view.addGestureRecognizer(rightSwipe)
        
        
      
          }
          
          //Handle swipes function
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
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
