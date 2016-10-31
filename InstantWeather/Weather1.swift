//
//  weather.swift
//  weat
//
//  Created by TARUN GUDELA on 4/28/16.
//  Copyright © 2016 TARUN GUDELA. All rights reserved.
//

import Foundation

protocol WeatherDelegate1 {
    
    
    func setWeather(_ weatherStruct: WeatherStruct)
    
    
}

class Weather1{
    
    
    
    var delegate: WeatherDelegate1?
    
    func getWeather(_ city: String){
        // will get weather here
        
       // let cityEscaped = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        
        print("city name which we are collecting weather: \(city)")
        let path = "http://api.openweathermap.org/data/2.5/weather?zip=\(city),us&appid=b6bf2c36f1e9b411f4ae158c65205e38"
        let url = URL(string: path)
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: { (data: Data?, response: URLResponse?, error: NSError?) in
            ///print(data)
            
            let json = JSON(data: data!)
            let lon = json["coord"]["lon"].double
            let lat = json["coord"]["lat"].double
            let temp = json["main"]["temp"].double
            let name = json["name"].string
            let desc = json["weather"][0]["description"].string
            let icon = json["weather"][0]["icon"].string
            let sunrise = json["sys"]["sunrise"].double
            
            let sunset = json["sys"]["sunset"].double
            let wind = json["wind"]["speed"].double
            let humidity = json["main"]["humidity"].double
            
           // let weatherStruct = WeatherStruct(city: name!, temp: temp!, description: desc!)
            let weatherStruct = WeatherStruct(city: name!, temp: Int(Double(self.fixTempForDisplay(temp!))!), description: desc!, icon: icon!, sunset: sunset!, sunrise: sunrise!,  wind: wind!, humidity: humidity! )
            if self.delegate != nil {
                
                DispatchQueue.main.async(execute: {
                    self.delegate?.setWeather(weatherStruct)
                })
                
            }
            
            print("lat:\(lat!) lon:\(lon!) temp: \(temp)")
        } as! (Data?, URLResponse?, Error?) -> Void) 
        
        task.resume()
       
        
        
        
        //let  weatherStruct = WeatherStruct(city: city, temp: 200.12, description: "A Rainy day")
        //if delegate != nil {
        //    delegate?.setWeather(weatherStruct)
       // }
        
    }
    func cToF(_ tempC: Double) -> Double {
        return (tempC * 1.8) + 32
    }
    
    func fToC(_ tempF: Double) -> Double {
        return (tempF - 32) / 1.8
    }
    
    
    func kelvinToDegrees(_ tempK: Double) -> Double {
        return tempK - 272.15
    }
    
    
    func fixTempForDisplay(_ temp: Double) -> String {
        print("Kelvin: \(temp)")
        print("C: \(temp - 273.15)")
        
        let tempC = kelvinToDegrees(temp)
        let tempF = cToF(tempC)
        let tempR = round(tempF)
        let tempString = String(format: "%.0f", tempR)
        return tempString
    }
   // func timeFormat(sunset: Double) -> String {
     //   let date = NSDate(timeIntervalSince1970: sunset)
       // let timeformatter = NSDateFormatter()
        //timeformatter.dateFormat = "h:mma"
        
    //}
}
