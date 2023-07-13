//
//  Weather.swift
//  Weather
//
//  Created by Andrei Ulanov on 13.07.2023.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
