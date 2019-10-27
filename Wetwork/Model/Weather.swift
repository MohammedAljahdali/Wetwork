//
//  Weather.swift
//  Wetwork
//
//  Created by Ammar AlTahhan on 26/04/2019.
//  Copyright © 2019 Ammar AlTahhan. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let current: Current
    let location: Location
    let request: [String:String]
//    let summary: String
//    let iconUrl: String
//    let temperature: Double
//    let humidiy: Int
//    let windSpeed: Double
//    let cloud: Int
//    let isDay: String
//    let location: String
//
//    var isDayBool: Bool {
//        return isDay == "yes"
//    }
//
//    enum SerializationError:Error {
//        case missing(String)
//        case invalid(String, Any)
//    }
}
struct Location: Codable{
    let name: String
    let country: String
    let region: String
    let lat: String
    let lon: String
    let timezone_id: String
    let localtime: String
    let localtime_epoch: Int
    let utc_offset: String
}
struct Current: Codable {
    let temperature: Int
    let wind_speed: Int
    let weather_icons: [String]
    let humidity: Int
    let weather_descriptions: [String]
    let cloudcover: Int
    //ignore
    let weather_code: Int
    let wind_degree: Int
    let wind_dir: String
    let pressure: Int
    let precip: Int
    let feelslike: Int
    let uv_index: Int
    let visibility: Int
//    private enum CodingKeys: CodingKey {
//        case temperature, wind_speed, weather_icons, humidity, weather_Descriptions, cloudcover
//
//    }
}
