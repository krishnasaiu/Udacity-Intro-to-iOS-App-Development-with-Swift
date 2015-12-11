//
//  ViewController.swift
//  Is It Prime
//
//  Created by Krishna Sai on 12/4/15.
//  Copyright © 2015 Krishna Sai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var result: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isPrime(n: Double) -> Bool {
        if n == 1 || n == 0{
            return false
        }
        for var i:Double = 2; i <= sqrt(n); i++ {
            if n % i == 0 {
                return false
            }
        }
        return true
    }

    @IBAction func isItPrime(sender: AnyObject) {
        if let n = Double(number.text!) {
            if isPrime(n) {
                result.text = "It is prime!"
            } else {
                result.text = "it isn't prime!"
            }
        } else {
            result.text = "Please enter a whole number"
        }
    }
}

