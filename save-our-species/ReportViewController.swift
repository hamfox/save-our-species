//
//  ReportViewController.swift
//  save-our-species
//
//  Created by DSCommons on 10/23/19.
//  Copyright © 2019 MarineVP. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {
    
    //Buttons
    @IBAction func UploadButton(_ sender: UIButton) {}
    
    //Buttons with images
    @IBAction func LocationButton(_ sender: UIButton) {}
    @IBAction func cameraButton(_ sender: UIButton) {}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var ReportLabel: UILabel!
    
   
    @IBAction func descrField(_ sender: UITextField) {
        
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
