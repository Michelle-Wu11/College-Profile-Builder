//
//  DetailViewController.swift
//  College Profile Builder(Part A)
//
//  Created by 吴雨楠 on 16/7/25.
//  Copyright © 2016年 Yunan Wu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    var university : University!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        university.name = nameTextField.text!
        university.location = locationTextField.text!
        university.enrollment = Int(enrollmentTextField.text!)!
        if (university.image == nil) {
            imageView.image = UIImage(named: "default")
        } else {
            imageView.image = university.image
        }


    }

    @IBAction func onTappedSaveButton(sender: AnyObject) {
        
    }
}
