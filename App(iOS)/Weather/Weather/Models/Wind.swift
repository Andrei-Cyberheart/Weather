//
//  Wind.swift
//  Weather
//
//  Created by Andrei Ulanov on 13.07.2023.
//

import Foundation

struct Wind: Codable {
    let speed: Double
    let degree: Int
    let gust: Double
    
    enum CodingKeys: String, CodingKey {
        case speed
        case degree = "deg"
        case gust
    }
}
