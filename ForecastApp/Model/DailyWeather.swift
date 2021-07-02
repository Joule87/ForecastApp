//
//  DailyWeather.swift
//  ForecastApp
//
//  Created by Julio Collado on 2/7/21.
//

import Foundation

struct DailyWeather: Codable, Identifiable {
    var date: Int
    var temperature: Temperature
    var weather: [WeatherDetail]
    
    enum CodingKey: String {
        case date = "dt"
        case temperature = "temp"
        case weather
    }
    
    init() {
        date = 0
        temperature = Temperature(min: 0.0, max: 0.0)
        weather = [WeatherDetail(main: "", description: "", icon: "")]
    }
}

extension DailyWeather {
    var id: UUID {
        return UUID()
    }
}
