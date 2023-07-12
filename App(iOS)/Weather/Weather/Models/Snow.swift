//
//  Snow.swift
//  Weather
//
//  Created by Andrei Ulanov on 12.07.2023.
//

import Foundation

struct Snow: Codable {
    let oneHour: Double?
    let threeHours: Double?
    
    enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
        case threeHours = "3h"
    }
}
