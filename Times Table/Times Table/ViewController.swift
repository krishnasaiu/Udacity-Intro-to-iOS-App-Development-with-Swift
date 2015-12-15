//
//  ViewController.swift
//  Times Table
//
//  Created by Krishna Sai on 12/14/15.
//  Copyright © 2015 Krishna Sai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for (var i = 1; i<=20; i++) {
            timestable[i - 1] = String(i) + " X 1 = " + String(i)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var timestable = [String](count: 20, repeatedValue: "")
    
    @IBAction func sliderMoved(sender: AnyObject) {
        let value = Int(floor(sliderValue.value))
        print(value)
        for (var i = 1; i<=20; i++) {
            timestable[i - 1] = String(i) + " X " + String(value) + " = " + String(i * value)
        }
        self.table.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timestable.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = timestable[indexPath.row]
        
        return cell
    }
}