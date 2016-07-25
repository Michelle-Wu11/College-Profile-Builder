//
//  University.swift
//  College Profile Builder(Part A)
//
//  Created by 吴雨楠 on 16/7/25.
//  Copyright © 2016年 Yunan Wu. All rights reserved.
//

import UIKit

class University: NSObject {
    var name = ""
    var location = ""
    var enrollment = 0
    var image = UIImage(named: "Default")
    
    convenience init (name: String, location:String, enrollment: Int, image:UIImage){
        self.init()
        self.name = name
        self.location = location
        self.enrollment = enrollment
        self.image = image
    }
    
    convenience init(name: String){
        self.init()
        self.name = name
    }
}
