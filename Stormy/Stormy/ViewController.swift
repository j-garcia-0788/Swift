//
//  ViewController.swift
//  Stormy
//
//  Created by James Garcia on 5/21/15.
//  Copyright (c) 2015 James Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let apiKey = "eeae239f98e12a72771c085739bb4804"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/")
        
        let forecastURL = NSURL(string: "29.422721,-98.491419", relativeToURL: baseURL)
        
        let sharedSession = NSURLSession.sharedSession()
        
        let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(forecastURL!, completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
            
            if (error == nil) {
                let dataObject = NSData(contentsOfURL: location)
                let weatherDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as! NSDictionary
                let currentWeather = current(weatherDictionary: weatherDictionary)
                
                println(currentWeather.temperature)
            }

        })
        
        downloadTask.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

