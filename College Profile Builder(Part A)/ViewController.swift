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

}

