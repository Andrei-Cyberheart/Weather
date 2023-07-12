//
//  CurrentWeather.swift
//  Weather
//
//  Created by Andrei Ulanov on 10.07.2023.
//

import Foundation

struct CurrentWeather: Codable {

//    let sys: Sys?
//    let coord: Coord?
      let name: String?
    
//    let weather: [Weather]?
//    let base: String?
//    let main: Main?
//    let visibility: Int?
//    let wind: Wind?
//    let rain: Rain?
//    let clouds: Clouds?
//    let dt: Int?

    let timezone: Int?
    
    let cod: Int?
    
    private enum CodingKeys: String, CodingKey {
//        case coordinate = "coord"
//        case weather = "weather"
//        case base = "base"
//        case main = "main"
//        case visibility = "visibility"
//        case wind = "wind"
//        case rain = "rain"
//        case clouds = "clouds"
//        case date = "dt"
//        case sys = "sys"
        case timezone = "timezone"
        case name = "name"
        case cod = "cod"
        }
}
