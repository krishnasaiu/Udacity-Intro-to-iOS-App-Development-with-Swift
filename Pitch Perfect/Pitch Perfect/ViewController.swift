//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Krishna Sai on 10/14/15.
//  Copyright © 2015 Krishna Sai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true;
        recordButton.enabled = true;
    }

    @IBAction func recordAudio(sender: UIButton) {
        // TODO: record audio
        recordingInProgress.hidden = false;
        stopButton.hidden = false;
        recordButton.enabled = false;
    }

    @IBAction func stopRecording(sender: UIButton) {
        recordingInProgress.hidden = true;
    }
}

