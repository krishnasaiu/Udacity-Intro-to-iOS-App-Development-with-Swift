//
//  ViewController.swift
//  Animations
//
//  Created by Krishna Sai on 12/23/15.
//  Copyright © 2015 Krishna Sai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var animateButton: UIButton!
    
    var index = 0
    
    var state = true
    
    var images = ["frame1.png",
        "frame2.png",
        "frame3.png",
        "frame4.png",
        "frame5.png",
        "frame6.png",
        "frame7.png",
        "frame8.png",
        "frame9.png",
        "frame10.png",
        "frame11.png",
        "frame12.png",
        "frame13.png",
        "frame14.png",
        "frame15.png",
        "frame16.png"]
    
    var timer = NSTimer()
    
    @IBAction func animate(sender: AnyObject) {
        if state {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
            animateButton.setTitle("Stop", forState: UIControlState.Normal)
            
        } else {
            timer.invalidate()
            animateButton.setTitle("Start", forState: UIControlState.Normal)
        }
        state = !state

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func doAnimation() {
        index++
        if index == 16 {
            index = 0
        }
        
        image.image = UIImage(named: images[index])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override func viewDidLayoutSubviews() {
//        image.frame = CGRectMake(35, 159, 0, 0)
//    }
//    
//    override func viewDidAppear(animated: Bool) {
//        UIView.animateWithDuration(1) { () -> Void in
//            self.image.frame = CGRectMake(35, 159, 250, 250)
//        }
//    }
}

