//
//  CameraViewController.swift
//  save-our-species
//
//  Created by DSCommons on 11/7/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var uploadFromLibraryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //MARK: UIImagePickerControllerDelegate
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismisses the picker is the user taps canceled
        dismiss(animated: true, completion: nil)
        
    }
    
    
    // MARK: Actions
    @IBAction func uploadFromLibraryTapped(_ sender: UITapGestureRecognizer) {
        // lets  user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
         
        // allows to select photos from lib.
        imagePickerController.sourceType = .photoLibrary
         
        // notifies view controller when user picks photo
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
