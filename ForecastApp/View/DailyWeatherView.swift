//
//  DailyWeatherView.swift
//  ForecastApp
//
//  Created by Julio Collado on 3/7/21.
//

import SwiftUI

struct DailyWeatherView: View {
    
    @ObservedObject var cityViewModel: CityViewModel
    var body: some View {
        ForEach(cityViewModel.weather.daily) { weather in
            LazyVStack {
                dailyCell(weather: weather)
            }
        }
    }
    
    private func dailyCell(weather: DailyWeather) -> some View {
        HStack {
            Text(cityViewModel.getDayFor(timestamp: weather.date).uppercased())
                .frame(width: 50)
            Spacer()
            Text("max: \(cityViewModel.getTemperatureFor(temp: weather.temperature.max)) | min: \(cityViewModel.getTemperatureFor(temp: weather.temperature.min)) ℃")
            Spacer()
            LottieAnimationUtil.getWeatherIconFor(icon: weather.weather.first?.icon ?? "")
        }
        .foregroundColor(.white)
        .padding(.horizontal, 40)
        .padding(.vertical, 15)
        //FIXME:- Create a view modifier for this lines below
        .background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6050806046, green: 0.8078469634, blue: 0.9820559621, alpha: 1)), Color(#colorLiteral(red: 0.4927015901, green: 0.6170919538, blue: 0.9509068131, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 2, y: 2)
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(cityViewModel: CityViewModel())
    }
}
