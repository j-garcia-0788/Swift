//
//  Current.swift
//  Stormy
//
//  Created by James Garcia on 5/26/15.
//  Copyright (c) 2015 James Garcia. All rights reserved.
//

import Foundation

struct current {
    
    var currentTime: Int
    var temperature: Int
    var humidity: Double
    var precipProbability: Double
    var summary: String
    var icon: String
    
    init(weatherDictionary: NSDictionary){
        let currentWeather = weatherDictionary["currently"] as! NSDictionary
        
        currentTime = currentWeather["time"] as! Int
        temperature = currentWeather["temperature"] as! Int
        humidity = currentWeather["humidity"] as! Double
        precipProbability = currentWeather["precipProbability"] as! Double
        summary = currentWeather["summary"] as! String
        icon = currentWeather["icon"] as! String
    }
    
    
    func dateStringFromUnixTime(unixTime: Int) -> String {
        let timeInSeconds = NSTimeInterval(unixTime)
        let weatherDate = NSDate(timeIntervalSince1970: timeInSeconds)
        
    }

}