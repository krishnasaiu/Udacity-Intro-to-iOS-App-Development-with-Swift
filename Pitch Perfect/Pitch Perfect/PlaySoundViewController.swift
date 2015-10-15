//
//  PlaySoundViewController.swift
//  Pitch Perfect
//
//  Created by Krishna Sai on 10/15/15.
//  Copyright © 2015 Krishna Sai. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            let filepath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")
            //print(filepath)
            let filePathUrl = NSURL.fileURLWithPath(filepath!)
            audioPlayer = try AVAudioPlayer(contentsOfURL: filePathUrl)
            audioPlayer.enableRate = true
            
            
        } catch {
                print("The file path is empty")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSlowAudio(sender: UIButton) {
        play(0.5)
    }
    
    @IBAction func playFastAudio(sender: UIButton) {
        play(2.0)
    }
    
    func play(rate: Float32) {
        audioPlayer.stop()
        audioPlayer.rate = rate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        audioPlayer.stop()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
