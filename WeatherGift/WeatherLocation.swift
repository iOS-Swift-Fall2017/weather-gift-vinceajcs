//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Vincent Stephen Huang on 10/23/17.
//  Copyright © 2017 Huang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemp = "--"
    var currentSummary = ""
    
    func getWeather(completed: @escaping() -> ()) {
        let weatherURL = urlBase + urlAPIKey + coordinates
        
        Alamofire.request(weatherURL).responseJSON{ response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let temperature = json["currently"]["temperature"].double {
                    let roundedTemp = String(format: "%3.f", temperature)
                    self.currentTemp = roundedTemp + "°"
                } else {
                    print("Could not return a temperature")
                }
                
                
                
                if let weatherSummary = json["daily"]["summary"].string {
                    self.currentSummary = weatherSummary
                } else {
                    print("Could not return a summary")
                }

            case .failure(let error):
                print(error)
            }
            completed()
        }
    }
}
