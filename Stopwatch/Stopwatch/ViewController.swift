//
//  ViewController.swift
//  Stopwatch
//
//  Created by Krishna Sai on 12/11/15.
//  Copyright © 2015 Krishna Sai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var secs = 0
    var mins = 0
    var hours = 0
    var timer = NSTimer()
    
    @IBOutlet weak var watch: UILabel!
    
    func result() {
        secs++
        if secs == 6 {
            secs = 0
            mins++
            if mins == 60 {
                hours++
            }
        }
        dispatch_async(dispatch_get_main_queue()) {
            self.watch.text = "\(self.hours)\" \(self.mins)\' \(self.secs)"
        }
    }

    @IBAction func start(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func stop(sender: AnyObject) {
        timer.invalidate()
        secs = 0
        mins = 0
        hours = 0
        watch.text = "0\" 0\' 0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

