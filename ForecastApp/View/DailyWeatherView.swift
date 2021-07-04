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
        HStack(spacing: 10) {
            Text(cityViewModel.getDayFor(timestamp: weather.date).uppercased())
                .bold()
                .frame(width: 50)
                .padding(.leading, 20)
            Spacer()
            Text("max: \(cityViewModel.getTemperatureFor(temp: weather.temperature.max)) | min: \(cityViewModel.getTemperatureFor(temp: weather.temperature.min)) ℃")
                .font(.title3)
            Spacer()
            LottieAnimationUtil.getWeatherIconFor(icon: weather.weather.first?.icon ?? "")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(.horizontal, 20)
        }
        .foregroundColor(.white)
        .padding(.vertical, 15)
        .clearDaySkyBackgroundStyle()
        .padding(.horizontal, 10)
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(cityViewModel: CityViewModel())
    }
}
