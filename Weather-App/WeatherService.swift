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
        
        let cityEscaped = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        let appid = "0e7b7d5c2172c35130275ea5cd8a79b0"
        
        
        let path = "http://api.openweathermap.org/data/2.5/weather?q=\(cityEscaped!)&APPID=\(appid)"
        let url  = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            let json = JSON(data: data!)
            
            print(json)
            
            let lon = json["coord"]["lon"].double
            let lat  = json["coord"]["lat"].double
            let temp = json["main"]["temp"].double
            let name = json["name"].string
            let desc = json["weather"][0]["description"].string
            let icon = json["weather"][0]["icon"].string
            let clouds = json["clouds"]["all"].double
            
            let weather = Weather(cityName: name!, temp: temp!, description: desc!, icon: icon!, clouds: clouds!)
            
            if(self.delegate != nil){
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.delegate?.setWeather(weather)
                })
                
            }
            
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