//
//  WeatherService.swift
//  Weather-App
//
//  Created by Set Kyar on 5/11/16.
//  Copyright © 2016 setkyarwalar. All rights reserved.
//

import Foundation

protocol WeatherServiceDelegate {
    func setWeather()
}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    func getWeather(city: String) {
        print("Weather Service city: \(city)")
        
        //make a request to get weahter data
        //wait...
        
        if delegate != nil {
            delegate?.setWeather()
        }
    }
    
}