//
//  API.swift
//  Wetwork
//
//  Created by Ammar AlTahhan on 26/04/2019.
//  Copyright © 2019 Ammar AlTahhan. All rights reserved.
//

import Foundation

class API {
    
    // Note: http://api.apixu.com/v1/current.json?key=[APIKey]&q=[CityName||Coordinates]
    static let basePath = "https://api.apixu.com/v1/current.json?key=9bb49a2850f344fc8ba74245192604"
    
    class func getWeatherDataForCityName(_ name: String, completion: @escaping (_ weatherObject: Weather?, _ err: Error?)->Void) {
        
        let url = URL(string: basePath + "&q=\(name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)")!
        
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
                            let currentJson = json["current"] as? [String: Any],
                            let conditionJson = currentJson["condition"] as? [String: Any] {
                            
                            // TODO: Complete creating weatherObject
                            weatherObject = Weather(summary: conditionJson["text"] as! String,
                                                        iconCode: "\(conditionJson["code"] as! Int)",
                                                        temperature: currentJson["temp_c"] as! Double,
                                                        humidiy: currentJson["humidity"] as! Int,
                                                        windSpeed: currentJson["wind_kph"] as! Double,
                                                        cloud: currentJson["cloud"] as! Int,
                                                        isDay: currentJson["is_day"] as! Int,
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

    


    
    

