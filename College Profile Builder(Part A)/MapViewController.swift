//
//  MapViewController.swift
//  College Profile Builder(Part A)
//
//  Created by 吴雨楠 on 16/7/27.
//  Copyright © 2016年 Yunan Wu. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var textField: UITextField!
    
    var location = ""
    var placemark = CLGeocoder()
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = location
        findLocation(location)
        /*      let center = CLGeocoder(location)
         let span = MKCoordinateSpanMake(0.01, 0.01)
         displayMap(center, span: span, pinTitle: textField.text!)   */
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let locationName = textField.text!
        textField.resignFirstResponder()
        findLocation(locationName)
        return true
        
    }
    
    func findLocation(locationName: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(locationName)
        { (placemarks,error) in
            if error != nil {
                print (error)
            }
            else {
                if placemarks!.count > 1 {
                    let actionController = UIAlertController(title: "Select a location", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
                    for placemark in placemarks!{
                        let locationAction = UIAlertAction(title: locationName, style: .Default) { (action) in
                            print("")
                        }
                        actionController.addAction(locationAction)
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                    actionController.addAction(cancelAction)
                    self.presentViewController(actionController, animated: true, completion: nil)
                } else {
                    let placemark = placemarks!.first as CLPlacemark!
                    let center = placemark.location!.coordinate
                    let span = MKCoordinateSpanMake(0.1, 0.1)
                    self.displayMap(center, span: span, pinTitle: self.textField.text!)
                }
            }
        }
    }
    
    func displayMap(center: CLLocationCoordinate2D,
                    span: MKCoordinateSpan,
                    pinTitle: String) {
        let region = MKCoordinateRegionMake(center, span)
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = pinTitle
        mapView.addAnnotation(pin)
        mapView.setRegion(region, animated: true)
    }
    
}