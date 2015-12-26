//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Krishna Sai on 12/20/15.
//  Copyright © 2015 Krishna Sai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.mangatown.net/manga/onepunch-man/1")!
        
        webView.loadRequest(NSURLRequest(URL: url))
        
//        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
//            if let urlContent = data {
//                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
//                
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    self.webView.loadHTMLString(String(webContent!), baseURL: nil)
//                })
//            } else {
//                print(error)
//            }
//        }
//        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

