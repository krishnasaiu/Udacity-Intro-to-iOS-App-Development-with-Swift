//
//  SecondViewController.swift
//  TODO List
//
//  Created by Krishna Sai on 12/18/15.
//  Copyright © 2015 Krishna Sai. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var task: UITextField!
    
    @IBAction func add(sender: AnyObject) {
        toDoList.append(task.text!)
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        task.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

