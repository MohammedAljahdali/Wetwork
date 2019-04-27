//
//  Weather.swift
//  Wetwork
//
//  Created by Ammar AlTahhan on 26/04/2019.
//  Copyright © 2019 Ammar AlTahhan. All rights reserved.
//

import Foundation

struct Weather {
    let summary: String
    let iconCode: String
    let temperature: Double
    let humidiy: Int
    let windSpeed: Double
    let cloud: Int
    let isDay: Int
    let location: String
    
    
    var iconName: String {
        let icons = try! JSONSerialization.jsonObject(with: Data(contentsOf: Bundle.main.url(forResource: "Icons", withExtension: "json")!), options: .allowFragments) as! [[String: Any]]
        
        return "\(icons.first(where: {"\($0["code"] as! Int)" == iconCode})!["icon"] as! Int)"
    }
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
}
