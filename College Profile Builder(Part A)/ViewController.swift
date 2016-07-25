//
//  ViewController.swift
//  College Profile Builder(Part A)
//
//  Created by 吴雨楠 on 16/7/25.
//  Copyright © 2016年 Yunan Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var universities = ["University of Texas at Austin", "University of Illinois", "University of Washington, Seattle"]
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return universities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = universities[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete{
            universities.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }

    @IBAction func onTappedPlusButton(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add University", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Add University Here"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default)
        { (action) in
            let universityTextField = alert.textFields![0] as UITextField
            self.universities.append(universityTextField.text!)
            self.tableView.reloadData()
        }
        
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

