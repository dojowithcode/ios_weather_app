//
//  Weather.swift
//  Weather-App
//
//  Created by Set Kyar on 5/12/16.
//  Copyright © 2016 setkyarwalar. All rights reserved.
//

import Foundation

struct Weather {
    let cityName: String
    let temp: Double
    let description: String
    let icon: String
    let clouds: Double
    
    init(cityName: String, temp: Double, description: String, icon: String, clouds: Double) {
        self.cityName       = cityName
        self.temp           = temp
        self.description    = description
        self.icon           = icon
        self.clouds         = clouds
    }
    
}
