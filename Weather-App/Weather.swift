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
    
    init(cityName: String, temp: Double, description: String) {
        self.cityName    = cityName
        self.temp         = temp
        self.description = description
    }
    
}
