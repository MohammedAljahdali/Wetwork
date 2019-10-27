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
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { completion(nil, error); return }
                        if let data = data {
                            let decoder = JSONDecoder()
                            do {
                            let json = try decoder.decode(Weather.self, from: data)
                                
                                print(json)
                                completion(json, nil)
                            } catch {
                                print(error.localizedDescription)
                            }
                            
                            // TODO: Call completion to notify the ViewController
        }
        }
        task.resume()
            
        

        
        
        
        // TODO: Call resume() on the dataTask object
    
        
    
}
}
    


    
    

