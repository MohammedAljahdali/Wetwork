//
//  API.swift
//  Wetwork
//
//  Created by Ammar AlTahhan on 26/04/2019.
//  Copyright © 2019 Ammar AlTahhan. All rights reserved.
//

import Foundation

class API {
    
    // Note: http://api.weatherstack.com/current?access_key=[APIKey]&query=[CityNameORCoordinates]
    
    static let basePath = "http://api.weatherstack.com/current?access_key=e3ffb95a9965afa627fead7c93471af3"
    
    class func getWeatherDataForCityName(_ name: String, completion: @escaping (_ weatherObject: Weather?, _ err: Error?)->Void) {
        
        let url = URL(string: basePath + "&query=\(name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)")!
        
        // TODO: Create URLRequest object
        let request = URLRequest(url: url)
        
        // TODO: Create URLSession dataTask
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            
            guard error == nil else { completion(nil, error); return }
            
            var weatherObject: Weather?
            
            if let data = data {
                do {
                    
                    // TODO: Use if-let to convert (data) to (jsonObject) using JSONSerialization
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        // TODO: Use if-let to get required json dictionaries
                        if let locationJson = json["location"] as? [String: Any],
                            let currentJson = json["current"] as? [String: Any] {
                            
                            // TODO: Complete creating weatherObject
                            weatherObject = Weather(summary: (currentJson["weather_descriptions"] as! [String]).first ?? "",
                                                        iconUrl: (currentJson["weather_icons"] as! [String]).first ?? "",
                                                        temperature: currentJson["temperature"] as! Double,
                                                        humidiy: currentJson["humidity"] as! Int,
                                                        windSpeed: currentJson["wind_speed"] as! Double,
                                                        cloud: currentJson["cloudcover"] as! Int,
                                                        isDay: currentJson["is_day"] as! String,
                                                        location: "\(locationJson["name"] as! String)\n\(locationJson["region"] as! String), \(locationJson["country"] as! String)")
                            
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
                
                // TODO: Call completion to notify the ViewController
                completion(weatherObject, nil)
            }
        }
        
        // TODO: Call resume() on the dataTask object
        task.resume()
        
    }
}

    


    
    

