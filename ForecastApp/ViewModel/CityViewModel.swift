//
//  c.swift
//  ForecastApp
//
//  Created by Julio Collado on 2/7/21.
//

import SwiftUI
import CoreLocation

final class CityViewModel: ObservableObject {
    @Published var weather = WeatherResponse.empty()
    @Published var city: String = "Montevideo" {
        didSet {
            getLocation()
        }
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    private lazy var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    init() {
        getLocation()
    }
    
    var date: String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.date)))
    }
    
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "dayClearSky"
    }
    
    var conditions: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    }
    
    var temperature: String {
        return getTemperatureFor(temp: weather.current.temp)
    }
    
    var windSpeed: String {
        return String(format: "%0.1f", weather.current.windSpeed)
    }
    
    var humidity: String {
        return String(format: "%d%%", weather.current.humidity)
    }
    
    var rainChances: String {
        return String(format: "%0.0f%%", weather.current.dewPoint)
    }
    
    func getTimeFor(timestamp: Int) -> String {
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func getTemperatureFor(temp: Double) -> String {
        return String(format: "%0.1f", temp)
    }
    
    func getDayFor(timestamp: Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    private func getWeather(coordinates: CLLocationCoordinate2D?) {
        if let coordinates = coordinates {
            let urlString = API.getURLFor(lat: coordinates.latitude, long: coordinates.longitude)
            requestWeather(for: urlString)
        }
    }
    
    private func requestWeather(for urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        NetworkManager<WeatherResponse>.fetch(for: url) { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.weather = response
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { [weak self] placemarks, error in
            guard let place = placemarks?.first else {
                return
            }
            self?.getWeather(coordinates: place.location?.coordinate)
        }
    }
}
