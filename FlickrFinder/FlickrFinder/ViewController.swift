//
//  ViewController.swift
//  FlickrFinder
//
//  Created by Krishna Sai on 10/21/15.
//  Copyright © 2015 Krishna Sai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /* 1 - Define constants */
    let BASE_URL = "https://api.flickr.com/services/rest/"
    let METHOD_NAME = "flickr.photos.search"
    let API_KEY = "28fbf2daa96323adc6c16ef59507ed91"
    let TEXT = "baby asian elephant"
    let EXTRAS = "url_m"
    let DATA_FORMAT = "json"
    let NO_JSON_CALLBACK = "1"
    
    var tapRecognizer: UITapGestureRecognizer? = nil

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var phraseText: UITextField!
    @IBOutlet weak var search1: UIButton!
    
    @IBOutlet weak var latText: UITextField!
    @IBOutlet weak var lonText: UITextField!
    @IBOutlet weak var search2: UIButton!
    
    @IBOutlet weak var imageNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Show/Hide Keyboard
    
    func addKeyboardDismissRecognizer() {
        self.view.addGestureRecognizer(tapRecognizer!)
    }
    
    func removeKeyboardDismissRecognizer() {
        self.view.removeGestureRecognizer(tapRecognizer!)
    }
    
    func handleSingleTap(recognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func subscribeToKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeToKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if self.imageView.image != nil {
            //self.defaultLabel.alpha = 0.0
        }
        if self.view.frame.origin.y == 0.0 {
            self.view.frame.origin.y -= self.getKeyboardHeight(notification) / 2
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if self.imageView.image == nil {
            //self.defaultLabel.alpha = 1.0
        }
        if self.view.frame.origin.y != 0.0 {
            self.view.frame.origin.y += self.getKeyboardHeight(notification) / 2
        }
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.CGRectValue().height
    }
    
    
    

    @IBAction func searchPhotosByPhrase(sender: UIButton) {
        
        /* 2 - API method arguments */
        let methodArguments = [
            "method": METHOD_NAME,
            "api_key": API_KEY,
            "text": TEXT,
            "extras": EXTRAS,
            "format": DATA_FORMAT,
            "nojsoncallback": NO_JSON_CALLBACK
        ]
        
        /* 3 - Initialize session and url */
        let session = NSURLSession.sharedSession()
        let urlString = BASE_URL + escapedParameters(methodArguments)
        let url = NSURL(string: urlString)!
        let request = NSURLRequest(URL: url)
        
        /* 4 - Initialize task for getting data */
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            
            /* 5 - Check for a successful response */
            /* GUARD: Was there an error? */
            guard (error == nil) else {
                print("There was an error with your request: \(error)")
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? */
            guard let statusCode = (response as? NSHTTPURLResponse)?.statusCode where statusCode >= 200 && statusCode <= 299 else {
                if let response = response as? NSHTTPURLResponse {
                    print("Your request returned an invalid response! Status code: \(response.statusCode)!")
                } else if let response = response {
                    print("Your request returned an invalid response! Response: \(response)!")
                } else {
                    print("Your request returned an invalid response!")
                }
                return
            }
            
            /* GUARD: Was there any data returned? */
            guard let data = data else {
                print("No data was returned by the request!")
                return
            }
            
            /* Parse the data! */
            let parsedResult: AnyObject!
            do {
                parsedResult = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            } catch {
                parsedResult = nil
                print("Could not parse the data as JSON: '\(data)'")
                return
            }
            
            /* GUARD: Did Flickr return an error? */
            guard let stat = parsedResult["stat"] as? String where stat == "ok" else {
                print("Flickr API returned an error. See error code and message in \(parsedResult)")
                return
            }
            
            /* GUARD: Is "photos" key in our result? */
            guard let photosDictionary = parsedResult["photos"] as? NSDictionary else {
                print("Cannot find keys 'photos' in \(parsedResult)")
                return
            }
            
            /* 2 - Determine the total number of photos */
            /* GUARD: Is the "total" key in photosDictionary? */
            guard let totalPhotos = (photosDictionary["total"] as? NSString)?.integerValue else {
                print("Cannot find key 'total' in \(photosDictionary)")
                return
            }
            
            /* 3 - If photos are returned, let's grab one! */
            if totalPhotos > 0 {
                
                /* GUARD: Is the "photo" key in photosDictionary? */
                guard let photosArray = photosDictionary["photo"] as? [[String: AnyObject]] else {
                    print("Cannot find key 'photo' in \(photosDictionary)")
                    return
                }
                
                /* 4 - Get a random index, and pick a random photo's dictionary */
                let randomPhotoIndex = Int(arc4random_uniform(UInt32(photosArray.count)))
                let photoDictionary = photosArray[randomPhotoIndex] as [String: AnyObject]
                
                /* 5 - Prepare the UI updates */
                let photoTitle = photoDictionary["title"] as? String /* non-fatal */
                
                /* GUARD: Does our photo have a key for 'url_m'? */
                guard let imageUrlString = photoDictionary["url_m"] as? String else {
                    print("Cannot find key 'url_m' in \(photoDictionary)")
                    return
                }
                
                let imageURL = NSURL(string: imageUrlString)
                
                /* 6 - Update the UI on the main thread */
                if let imageData = NSData(contentsOfURL: imageURL!) {
                    dispatch_async(dispatch_get_main_queue(), {
                        //print("Success, update the UI here...")
                        print(photoTitle)
                        self.imageNameLabel.contentMode = UIViewContentMode.ScaleAspectFit
                        self.imageNameLabel.text = photoTitle
                        self.imageNameLabel.autoresizesSubviews = true
                        
                        //self.imageNameLabel.numberOfLines = 0
                        //self.imageNameLabel.sizeToFit()
                        
                        self.imageView.contentMode = UIViewContentMode.ScaleAspectFit
                        self.imageView.image = UIImage(data: imageData)
                    })
                } else {
                    print("Image does not exist at \(imageURL)")
                }
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    print("No Photos Found. Search Again.")
                    self.imageNameLabel.text = "No Photos Found"
                    self.imageView.image = nil;
                })
            }
        }
        /* 9 - Resume (execute) the task */
        task.resume()

    }
    
    /* Helper function: Given a dictionary of parameters, convert to a string for a url */
    func escapedParameters(parameters: [String : AnyObject]) -> String {
        
        var urlVars = [String]()
        
        for (key, value) in parameters {
            
            /* Make sure that it is a string value */
            let stringValue = "\(value)"
            
            /* Escape it */
            let escapedValue = stringValue.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
            
            /* Append it */
            urlVars += [key + "=" + "\(escapedValue!)"]
            
        }
        
        return (!urlVars.isEmpty ? "?" : "") + urlVars.joinWithSeparator("&")
    }

    @IBAction func searchPhotosByLatLon(sender: UIButton) {
    }
}

