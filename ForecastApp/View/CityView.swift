//
//  CityView.swift
//  ForecastApp
//
//  Created by Julio Collado on 3/7/21.
//

import SwiftUI

struct CityView: View {
    
    @ObservedObject var cityViewModel: CityViewModel
    
    var body: some View {
        VStack {
            CityNameView(city: cityViewModel.city, date: cityViewModel.date)
            TodayWeatherView(cityViewModel: cityViewModel)
            HourlyWeatherView(cityModelView: cityViewModel)
            DailyWeatherView(cityViewModel: cityViewModel)
        }.padding(.bottom, 30)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView(cityViewModel: CityViewModel())
    }
}
