//
//  Coordinate.swift
//  Weather
//
//  Created by Andrei Ulanov on 10.07.2023.
//

import Foundation

struct Coordinate: Codable {
    let longitude: Double
    let latitude: Double
    
    enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
}
