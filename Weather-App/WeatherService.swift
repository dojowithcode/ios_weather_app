//
//  WeatherService.swift
//  Weather-App
//
//  Created by Set Kyar on 5/11/16.
//  Copyright © 2016 setkyarwalar. All rights reserved.
//

import Foundation

protocol WeatherServiceDelegate {
    func setWeather(weather: Weather)
}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    func getWeather(city: String) {
        
        let path = "http://api.openweathermap.org/data/2.5/weather?q=Yangon&APPID=0e7b7d5c2172c35130275ea5cd8a79b0"
        let url  = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            let json = JSON(data: data!)
            
            let lon = json["coord"]["lon"].double
            let lat  = json["coord"]["lat"].double
            let temp = json["main"]["temp"].double
            
            print("Lat: \(lat!) Long: \(lon!) temp: \(temp!)")
            
        }
        
        task.resume()
        
        
        //print("Weather Service city: \(city)")
        
        //make a request to get weahter data
        //wait...
        //process data
        
//        let weather = Weather(cityName: city, temp: 237.12, description: "A nice day")
//        
//        if delegate != nil {
//            delegate?.setWeather(weather)
//        }
    }
    
}