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
        print("Weather Service city: \(city)")
        
        //make a request to get weahter data
        //wait...
        //process data
        
        let weather = Weather(cityName: city, temp: 237.12, description: "A nice day")
        
        if delegate != nil {
            delegate?.setWeather(weather)
        }
    }
    
}