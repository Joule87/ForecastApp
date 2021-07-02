//
//  WeatherResponse.swift
//  ForecastApp
//
//  Created by Julio Collado on 2/7/21.
//

import Foundation

struct WeatherResponse: Codable {
    var current: Weather
    var hourly: [Weather]
    var daily: [DailyWeather]
    
    static func empty() -> WeatherResponse {
        return WeatherResponse(current: Weather(), hourly: [Weather](repeating: Weather(), count: 20), daily: [DailyWeather](repeating: DailyWeather(), count: 8))
    }
}
