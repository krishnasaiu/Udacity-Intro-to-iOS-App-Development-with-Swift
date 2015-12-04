//
//  ViewController.swift
//  Hello World
//
//  Created by Krishna Sai on 11/30/15.
//  Copyright © 2015 Krishna Sai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var helpLabel: UILabel!
    @IBOutlet weak var catYears: UILabel!
    
    @IBAction func submit(sender: AnyObject) {
        //print("Button tapped")
        if let age = Int(textField.text!) {
            catYears.text = String(age * 7)
        }
        helpLabel.hidden = false
        catYears.hidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        helpLabel.hidden = true
        catYears.hidden = true
        //print("Hello Krishna!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

