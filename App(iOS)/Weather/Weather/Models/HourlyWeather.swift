//
//  HourlyWeather.swift
//  Weather
//
//  Created by Andrei Ulanov on 14.07.2023.
//

import Foundation

struct HourlyWeather: Codable {
    let cod: String
    let message: Int
    let count: Int
    let list: [List]
    let city: City
    
    enum CodingKeys: String, CodingKey {
        case cod
        case message
        case count = "cnt"
        case list
        case city
    }
}
