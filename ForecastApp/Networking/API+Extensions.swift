//
//  API+Extensions.swift
//  ForecastApp
//
//  Created by Julio Collado on 2/7/21.
//

import Foundation

extension API {
    static let baseURLString = "https://api.openweathermap.org/data/2.5/"
    
    static func getURLFor(lat: Double, long: Double) -> String {
        return "\(baseURLString)onecall?lat=\(lat)&lon=\(long)&exclude=minutely&appid=\(key)&units=metric"
    }
}
