//
//  Sys.swift
//  Weather
//
//  Created by Andrei Ulanov on 13.07.2023.
//

import Foundation

struct Sys: Codable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}
