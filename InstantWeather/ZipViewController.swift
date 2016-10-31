//
//  ZipViewController.swift
//  InstantWeather
//
//  Created by TARUN GUDELA on 4/29/16.
//  Copyright © 2016 TARUN GUDELA. All rights reserved.
//

import UIKit

class ZipViewController: UIViewController, WeatherDelegate {
    
    
    
    let weather = Weather()
    
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
    @IBAction func setCityButtonTapped(_ sender: AnyObject) {
        print("setcityButtonTapped")
        openCityAlert()
        
    }
    
    
    
    //CREATING AN ALERT
    func openCityAlert(){
        
        //ALERT
        let alert = UIAlertController(title: "City",
                                      message: "EnterCity",
                                      preferredStyle: UIAlertControllerStyle.alert)
        //CANCELING AN ALERT
        
        let cancel = UIAlertAction(title: "Cancel",
                                   style: UIAlertActionStyle.cancel ,
                                   handler: nil)
        
        alert.addAction(cancel)
        
        
        //ACCEPTING AN ALERT
        let ok = UIAlertAction(title: "OK",
                               style: UIAlertActionStyle.default) { (action: UIAlertAction) in
                                print("ok")
                                
                                let textFeild = alert.textFields?[0]
                                
                                // intializing the city
                                let cityName = textFeild?.text
                                self.cityLabel.text = cityName
                                self.weather.getWeather(cityName!)
        }
        
        alert.addAction(ok)
        
        //TEXTFIELD FOR THE ALERT
        alert.addTextField { (textFeild: UITextField) in
            textFeild.placeholder = "City Name"
            
            
            //PRESENTING AN ALERT
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    // weather service Delegate
    func setWeather(_ weatherStruct: WeatherStruct) {
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

