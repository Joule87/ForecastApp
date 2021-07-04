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
                .padding(.top, 20)
            
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
        .foregroundColor(.white)
        .clearDaySkyBackgroundStyle()
        .padding(.horizontal, 10)
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
