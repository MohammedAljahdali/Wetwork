//
//  WeatherViewController.swift
//  Wetwork
//
//  Created by Ammar AlTahhan on 26/04/2019.
//  Copyright © 2019 Ammar AlTahhan. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var cloudLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var bottomStackView: UIStackView!
    
    var cityName: String = "Riyadh" {
        didSet {
            setTitleView()
            reloadWeather()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setTitleView()
        reloadWeather()
        prepareAnimation()
    }
    
    func reloadWeather() {
        let indicator = startIndicator()
        
        // TODO: Call API's getWeatherDataForCityName
        API.getWeatherDataForCityName(cityName) { (weather, error) in
            guard error == nil else {print(error); return}
            guard weather != nil else {print("nil weather"); return}
            DispatchQueue.main.async {
                if let weather = weather {
                    self.prepareAnimation()
                    indicator.removeFromSuperview()
                    self.updateUI(weatherObject: weather)
                    self.startAnimation()
                    
                    
                }
            }
            
            
        }
            // TODO: Use DispatchQueue
        
                
                
                // TODO: Check err and weather objects passed by the completion handler
        
        
                
                // TODO: Call updateUI(weatherObject:) to update the view
                
            
        
    }
    
    func updateUI(weatherObject: Weather) {
        conditionLabel.text = weatherObject.current.weather_descriptions[0]
        tempLabel.text = "\(weatherObject.current.temperature) °C"
        humidityLabel.text = "\(weatherObject.current.humidity)%"
        cloudLabel.text = "\(weatherObject.current.cloudcover)%"
        windSpeedLabel.text = "\(weatherObject.current.wind_speed) K/h"
        locationLabel.text = weatherObject.location.name
        setTheme(isDay: false)
        
        conditionImageView.downloaded(from: weatherObject.current.weather_icons.first!)
    }
    
    @IBAction func reloadBtnTapped(_ sender: Any) {
        reloadWeather()
    }


}
