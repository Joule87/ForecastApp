//
//  HourlyWeatherView.swift
//  ForecastApp
//
//  Created by Julio Collado on 3/7/21.
//

import SwiftUI

struct HourlyWeatherView: View {
    @ObservedObject var cityModelView: CityViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(cityModelView.weather.hourly) { weather in
                    let icon = LottieAnimationUtil.getWeatherIconFor(icon: weather.weather.first?.icon ?? "sun.max.fill" )
                    let hour = cityModelView.getTimeFor(timestamp: weather.date)
                    let temperature = cityModelView.getTemperatureFor(temp: weather.temp)
                    getHourlyView(hour: hour, image: icon, temp: temperature)
                }
            }
        }
        .padding(.leading, 10)
        .padding(.vertical, 10)
    }
    
    private func getHourlyView(hour: String, image: Image, temp: String) -> some View {
        VStack(spacing: 10) {
            Text(hour)
            image
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Text(temp)
        }
        .foregroundColor(.white)
        .padding()
        .clearDaySkyBackgroundStyle()
        
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(cityModelView: CityViewModel())
    }
}
