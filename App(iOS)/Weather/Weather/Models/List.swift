//
//  List.swift
//  Weather
//
//  Created by Andrei Ulanov on 14.07.2023.
//

import Foundation

struct List: Codable {
    let date: Int
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let rain: Rain?
    let sys: Sys
    let dateText: String

    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case main
        case weather
        case clouds
        case wind
        case visibility
        case pop
        case rain
        case sys
        case dateText = "dt_txt"
    }
}
