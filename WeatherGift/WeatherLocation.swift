//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Vincent Stephen Huang on 11/6/17.
//  Copyright © 2017 Huang. All rights reserved.
//

import Foundation
class WeatherLocation: Codable {
    
    var name = ""
    var coordinates = ""
    
    init(name: String, coordinates: String) {
        self.name = name
        self.coordinates = coordinates
    }
}
