//
//  kentViewController.swift
//  InstantWeather
//
//  Created by TARUN GUDELA on 4/30/16.
//  Copyright © 2016 TARUN GUDELA. All rights reserved.
//

import UIKit

class kentViewController: UIViewController , WeatherDelegate1 {
    
    
    
    let weather = Weather1()
    
    //OUTLETS
    @IBOutlet weak var tempLbl: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var cityLabel: UILabel!
    
    
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    
    
    
    
    //ACTIONS
    @IBAction func setCityButtonTapped(sender: AnyObject) {
        print("setcityButtonTapped")
        self.weather.getWeather("kent")
        
    }
    
    
    
    
    
    
    // weather service Delegate
    func setWeather(weatherStruct: WeatherStruct) {
        print("set weather method")
        print("city:\(weatherStruct.cityName) temp:\(weatherStruct.temp) Description:\(weatherStruct.description) humid: \(weatherStruct.humidity) wind: \(weatherStruct.wind)  sunset: \(weatherStruct.sunset)")
        cityLabel.text = weatherStruct.cityName
        tempLbl.text = "\(weatherStruct.temp)"
        descriptionLabel.text = weatherStruct.description
        iconImage.image = UIImage(named: weatherStruct.icon)
        humidityLabel.text = "\(Int(weatherStruct.humidity))%"
        windLabel.text = "\(weatherStruct.wind)mps"
        // sunsetLabel.text = "\(NSDate(timeIntervalSinceReferenceDate: sunset))"
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //assignign the weather service to the view controller
        self.weather.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
