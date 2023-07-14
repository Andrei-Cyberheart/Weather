//
//  CurrentWeather.swift
//  Weather
//
//  Created by Andrei Ulanov on 10.07.2023.
//

import Foundation

struct CurrentWeather: Codable {
    
    let id: Int
    let coordinate: Coordinate
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let rain: Rain?
    let snow: Snow?
    let clouds: Clouds
    let date: Int
    let sys: Sys
    let timezone: Int
    let name: String
    let cod: Int
    
    private enum CodingKeys: String, CodingKey {
        case id
        case coordinate = "coord"
        case weather
        case base
        case main
        case visibility
        case wind
        case rain
        case snow
        case clouds
        case date = "dt"
        case sys
        case timezone
        case name
        case cod
        
    }
}
