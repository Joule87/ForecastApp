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
        }.padding(.leading, 10)
    }
    
    private func getHourlyView(hour: String, image: Image, temp: String) -> some View {
        VStack(spacing: 20) {
            Text(hour)
            image.foregroundColor(.yellow)
            Text(temp)
        }
        .foregroundColor(.white)
        .padding()
        .background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6050806046, green: 0.8078469634, blue: 0.9820559621, alpha: 1)), Color(#colorLiteral(red: 0.4927015901, green: 0.6170919538, blue: 0.9509068131, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 2, y: 2)
        
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(cityModelView: CityViewModel())
    }
}
