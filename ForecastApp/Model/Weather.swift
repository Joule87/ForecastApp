//
//  Weather.swift
//  ForecastApp
//
//  Created by Julio Collado on 2/7/21.
//

import Foundation

struct Weather: Codable, Identifiable {
    var date: Int
    var temp: Double
    var feelsLike: Double
    var pressure: Int
    var humidity: Int
    var dewPoint: Double
    var clouds: Int
    var windSpeed: Double
    var windDeg: Int
    var weather: [WeatherDetail]
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temp
        case feelsLike = "feels_like"
        case pressure
        case humidity
        case dewPoint = "dew_point"
        case clouds
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
    }
    
    init() {
        date = 0
        temp = 0.0
        feelsLike = 0.0
        pressure = 0
        humidity = 0
        dewPoint = 0.0
        clouds = 0
        windSpeed = 0.0
        windDeg = 0
        weather = []
    }
}

extension Weather {
    var id: UUID {
        return UUID()
    }
}
