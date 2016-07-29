//
//  DetailViewController.swift
//  College Profile Builder(Part A)
//
//  Created by 吴雨楠 on 16/7/25.
//  Copyright © 2016年 Yunan Wu. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, SFSafariViewControllerDelegate {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var university : University!
    
    var imagePicker = UIImagePickerController()
    
    @IBAction func openInSafariWithDoneButton(sender: UIButton) {
        let url = NSURL(string: websiteTextField.text!)!
        let svc = SFSafariViewController(URL: url)
        presentViewController(svc, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = university.name
        locationTextField.text = university.location
        enrollmentTextField.text = String(university.enrollment)
        websiteTextField.text = university.website
        if (university.image == nil) {
            imageView.image = UIImage(named: "default")
        } else {
            imageView.image = university.image
        }
        imagePicker.delegate = self
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true) {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage
        }
    }
    
    @IBAction func onTappedSaveButton(sender: AnyObject) {
        
        university.name = nameTextField.text!
        university.location = locationTextField.text!
        university.enrollment = Int(enrollmentTextField.text!)!
        university.website = websiteTextField.text!
        university.image = imageView.image
    }
    
    @IBAction func onTappedLibraryButton(sender: UIButton) {
        
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func onTappedCameraButton(sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! MapViewController
        dvc.location = university.name
    }
}