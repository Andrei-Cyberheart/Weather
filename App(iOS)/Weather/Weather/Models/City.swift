//
//  City.swift
//  Weather
//
//  Created by Andrei Ulanov on 14.07.2023.
//

import Foundation

struct City: Codable {
    let id: Int
    let name: String
    let coordinate: Coordinate
    let country: String
    let population: Int
    let timezone: Int
    let sunrise: Int
    let sunset: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case coordinate = "coord"
        case country
        case population
        case timezone
        case sunrise
        case sunset
    }
}
