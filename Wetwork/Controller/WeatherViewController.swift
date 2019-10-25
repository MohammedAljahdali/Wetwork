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
        
            // TODO: Use DispatchQueue
        
                self.prepareAnimation()
                indicator.removeFromSuperview()
                
                // TODO: Check err and weather objects passed by the completion handler
        
        
                
                // TODO: Call updateUI(weatherObject:) to update the view
        
                self.startAnimation()
            
        
    }
    
    func updateUI(weatherObject: Weather) {
        conditionLabel.text = weatherObject.summary
        tempLabel.text = "\(weatherObject.temperature) °C"
        humidityLabel.text = "\(weatherObject.humidiy)%"
        cloudLabel.text = "\(weatherObject.cloud)%"
        windSpeedLabel.text = "\(weatherObject.windSpeed) K/h"
        locationLabel.text = weatherObject.location
        setTheme(isDay: weatherObject.isDayBool)
        
        conditionImageView.downloaded(from: weatherObject.iconUrl)
    }
    
    @IBAction func reloadBtnTapped(_ sender: Any) {
        reloadWeather()
    }


}
