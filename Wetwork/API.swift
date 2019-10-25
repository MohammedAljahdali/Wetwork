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
        
        
        // TODO: Create URLSession dataTask
        
            
//            guard error == nil else { completion(nil, error); return }
        
//            var weatherObject: Weather?
        
//            if let data = data {
//                do {
        
                    // TODO: Use if-let to convert (data) to (jsonObject) using JSONSerialization
        
                        // TODO: Use if-let to get required json dictionaries
        
        
        
                            
                            // TODO: Complete creating weatherObject
//                            weatherObject = Weather(summary: ,
//                                                        iconCode: ,
//                                                        temperature: ,
//                                                        humidiy: ,
//                                                        windSpeed: ,
//                                                        cloud: ,
//                                                        isDay: ,
//                                                        location: )
//
//                        }
//                    }
//                } catch {
//                    print(error.localizedDescription)
//                }
        
                // TODO: Call completion to notify the ViewController
        
        
        
        // TODO: Call resume() on the dataTask object
    
        
    }
}

    


    
    

