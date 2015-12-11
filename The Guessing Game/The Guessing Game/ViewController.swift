//
//  ViewController.swift
//  The Guessing Game
//
//  Created by Krishna Sai on 12/4/15.
//  Copyright © 2015 Krishna Sai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func guess(sender: AnyObject) {
        let randomNumber = String(arc4random_uniform(6))
        
        if  input.text! == randomNumber {
            image.image = UIImage(named: "ThumbsUp")
        } else {
            image.image = UIImage(named: "ThumbsDown")
        }
        
        input.text = ""
    }
}

