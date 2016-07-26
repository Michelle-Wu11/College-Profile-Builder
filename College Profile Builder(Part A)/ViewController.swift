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
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    //var universities = ["University of Texas at Austin", "University of Illinois at Urbana-Champaign", "University of Washington, Seattle"]
    var universities : [University] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.tag = 0
        universities.append(University(name: "University of Texas at Austin", location: "University Station, Austin, TX 78712-111", enrollment: 51000, image: UIImage(named: "University of Texas at Austin")!))
        universities.append(University(name: "University of Illinois at Urbana-Champaign", location: "Urbana-Champaign, Illinois", enrollment: 430000, image: UIImage(named: "University of Illinois at Urbana-Champaign")!))
        universities.append(University(name: "University of Washington, Seattle", location: "1410 NE Campus Parkway Box 355852，Seattle WA ", enrollment: 420000, image: UIImage(named: "University of Washington, Seattle")!))

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return universities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = universities[indexPath.row].name
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
            self.universities.append(University(name: universityTextField.text!))
            self.tableView.reloadData()
        }
        
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let university = universities[sourceIndexPath.row]
        universities.removeAtIndex(sourceIndexPath.row)
        universities.insert(university, atIndex: destinationIndexPath.row)
    }
    
    @IBAction func onTappedEditButton(sender: UIBarButtonItem) {
        if sender.tag == 0 {
            tableView.editing = true
            sender.tag = 1
        }else{
            tableView.editing = false
            sender.tag = 0
        }

    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! DetailViewController
        let index = tableView.indexPathForSelectedRow?.row
        dvc.university = universities[index!]
    }
}

