//
//  WeatherStruct.swift
//  weat
//
//  Created by TARUN GUDELA on 4/28/16.
//  Copyright © 2016 TARUN GUDELA. All rights reserved.
//

import Foundation

struct WeatherStruct {
    
    let cityName: String
    let temp: Int
    let description: String
    let icon: String
    let sunset: Double
    let sunrise: Double
    let wind: Double
    let humidity:Double
    
    
    init(city: String, temp:Int, description: String, icon: String, sunset: Double, sunrise: Double, wind: Double, humidity: Double){
        self.cityName = city
        self.temp = temp
        self.description = description
        self.icon = icon
        self.sunset = sunset
        self.sunrise = sunrise
        self.wind = wind
        self.humidity = humidity

    }
}