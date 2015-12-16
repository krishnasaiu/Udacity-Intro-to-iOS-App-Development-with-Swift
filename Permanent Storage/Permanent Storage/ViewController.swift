//
//  ViewController.swift
//  Permanent Storage
//
//  Created by Krishna Sai on 12/16/15.
//  Copyright © 2015 Krishna Sai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //NSUserDefaults.standardUserDefaults().setObject("Krishna", forKey: "name")
        
        let username = NSUserDefaults.standardUserDefaults().objectForKey("name")! as! NSString
        
        print(username)
        
        let array = [1, 2, 3, 4]
        
        NSUserDefaults.standardUserDefaults().setObject(array, forKey: "array")
        
        let a = NSUserDefaults.standardUserDefaults().objectForKey("array")! as! NSArray
        
        for i in a {
            print(i)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

