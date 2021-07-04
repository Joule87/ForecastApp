//
//  TodayWeatherView.swift
//  ForecastApp
//
//  Created by Julio Collado on 3/7/21.
//

import SwiftUI

struct TodayWeatherView: View {
    @ObservedObject var cityViewModel: CityViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Today")
                .font(.largeTitle)
                .bold()
            
            HStack(spacing: 20) {
                LottieView(name: LottieAnimationUtil.getLottieAnimationFor(icon: cityViewModel.weatherIcon))
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading) {
                    Text("\(cityViewModel.temperature) ℃")
                        .font(.system(size: 42))
                    Text("\(cityViewModel.conditions)")
                }
            }
            
            HStack {
                Spacer()
                widgetView(image: "wind", color: .green, title: "\(cityViewModel.windSpeed) km/h")
                Spacer()
                widgetView(image: "drop.fill", color: .blue, title: "\(cityViewModel.humidity)")
                Spacer()
                widgetView(image: "umbrella.fill", color: .red, title: "\(cityViewModel.rainChances)")
                Spacer()
            }.padding()
        }
        .padding()
        .foregroundColor(.white)
        .background(RoundedRectangle(cornerRadius: 20)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)).opacity(0.5))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.blue.opacity(0.2), radius: 2, x: 2, y: 2)
    }
    
    private func widgetView(image: String, color: Color, title: String) -> some View {
        VStack {
            Image(systemName: image)
                .padding()
                .font(.title)
                .foregroundColor(color)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            Text(title)
        }
    }
}

struct TodayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TodayWeatherView(cityViewModel: CityViewModel())
    }
}
