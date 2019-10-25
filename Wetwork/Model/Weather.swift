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
    let iconUrl: String
    let temperature: Double
    let humidiy: Int
    let windSpeed: Double
    let cloud: Int
    let isDay: String
    let location: String
    
    var isDayBool: Bool {
        return isDay == "yes"
    }
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
}
