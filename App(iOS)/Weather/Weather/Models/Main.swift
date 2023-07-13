//
//  Main.swift
//  Weather
//
//  Created by Andrei Ulanov on 13.07.2023.
//

import Foundation

struct Main: Codable {
    let temperature: Double
    let feelsLike: Double
    let temperatureMin: Double
    let temperatureMax: Double
    let pressure: Int
    let humidity: Int
    let seaLevel: Int
    let groundLevel: Int
    
    enum CodingKeys: String, CodingKey {
        case temperature
        case feelsLike = "feels_like"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
        case pressure
        case humidity
        case seaLevel = "sea_level"
        case groundLevel = "grnd_level"
    }
}
