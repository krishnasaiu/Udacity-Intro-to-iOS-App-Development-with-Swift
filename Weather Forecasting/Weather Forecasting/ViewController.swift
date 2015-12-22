//
//  ViewController.swift
//  Weather Forecasting
//
//  Created by Krishna Sai on 12/21/15.
//  Copyright © 2015 Krishna Sai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var errormsg: UILabel!
    @IBOutlet weak var weather: UITextView!
    
    @IBAction func search(sender: AnyObject) {
        
        if city.text!.rangeOfString("^$|^ *$", options: .RegularExpressionSearch) == nil {
        
            let attemptedURL = NSURL(string: formatURL(city.text!))
            
            if let url = attemptedURL {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
                if data != nil {
                    let webContent = NSString(data: data!, encoding: NSUTF8StringEncoding)
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.errormsg.text = ""
                        self.weather.text = self.getWeather(webContent!)
                    })
                    
                } else {
                    print(error)
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.errormsg.text = "Invalid City"
                    })
                }
            }
            task.resume()
            } else {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.errormsg.text = "Invalid City"
                })
            }
        } else {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.errormsg.text = "Enter a City"
            })
        }
        
    }
    
    func formatURL(url: String) -> String {
        return "http://www.weather-forecast.com/locations/" + url.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest/"
    }
    
    func getWeather(html: NSString) -> String {
        
        let webSiteArray = html.componentsSeparatedByString("<span class=\"phrase\">")
        
        if webSiteArray.count > 0 {
                
            print(webSiteArray[1])
        
            let weatherData = webSiteArray[1].componentsSeparatedByString("</span>")[0]
        
            return weatherData.stringByReplacingOccurrencesOfString("&deg;", withString: "°")
            
        } else {
            return "No data available"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.city.delegate = self
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

