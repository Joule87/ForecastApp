//
//  LottieAnimationUtil.swift
//  ForecastApp
//
//  Created by Julio Collado on 2/7/21.
//

import SwiftUI

final class LottieAnimationUtil {
    static func getLottieAnimationFor(icon: String) -> String {
        switch icon {
        case "01d":
            return "dayClearSky"
        case "01n":
            return "nightClearSky"
        case "02d":
            return "dayFewClouds"
        case "02n":
            return "nightFewClouds"
        case "03d":
            return "dayScatteredClouds"
        case "03n":
            return "nightScatteredClouds"
        case "04d":
            return "dayBrokenClouds"
        case "04n":
            return "nightBrokenClouds"
        case "09d":
            return "dayShowerRains"
        case "09n":
            return "nightsShowerRains"
        case "10d":
            return "dayRain"
        case "10n":
            return "nightRain"
        case "11d":
            return "dayThunderstorm"
        case "11n":
            return "nightThunderstorm"
        case "13d":
            return "daySnow"
        case "13n":
            return "nightSnow"
        case "50d":
            return "dayMist"
        case "50n":
            return "nightMist"
        default:
            return "dayClearSky"
        }
    }
    
    static func getWeatherIconFor(icon: String) -> Image {
        switch icon {
        case "01d":
            return Image(systemName: "sun.max.fill") //clear sky day
        case "01n":
            return Image(systemName: "moon.fill") //clear sky night
        case "02d":
            return Image(systemName: "cloud.sun.fill") //few clouds day
        case "02n":
            return Image(systemName: "cloud.moon.fill") //few clouds night
        case "03d":
            return Image(systemName: "cloud.fill") //scattered clouds
        case "03n":
            return Image(systemName: "cloud.fill") //scattered clouds
        case "04d":
            return Image(systemName: "cloud.fill") //scattered clouds
        case "04n":
            return Image(systemName: "cloud.fill") //scattered clouds
        case "09d":
            return Image(systemName: "cloud.drizzle.fill") //shower rain
        case "09n":
            return Image(systemName: "cloud.drizzle.fill") //shower rain
        case "10d":
            return Image(systemName: "cloud.heavyrain.fill") //day rain
        case "10n":
            return Image(systemName: "cloud.heavyrain.fill") //night rain
        case "11d":
            return Image(systemName: "cloud.bolt.fill") //thunderstorm day
        case "11n":
            return Image(systemName: "cloud.bolt.fill") //thunderstorm night
        case "13d":
            return Image(systemName: "cloud.snow.fill") //snow
        case "13n":
            return Image(systemName: "cloud.snow.fill") //snow
        case "50d":
            return Image(systemName: "cloud.fog.fill") //mist
        case "50n":
            return Image(systemName: "cloud.fog.fill") //mist
        default:
            return Image(systemName: "sun.max.fill") //clear sky day
        }
    }
    
}
