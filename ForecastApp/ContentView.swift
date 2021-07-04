//
//  ContentView.swift
//  ForecastApp
//
//  Created by Julio Collado on 2/7/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cityViewModel = CityViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    ScrollView(showsIndicators: false) {
                        Spacer().frame(height: 80)
                        CityView(cityViewModel: cityViewModel)
                    }
                    MenuHeaderView(cityViewModel: cityViewModel)
                }
            }
            .padding(.top, 40)
        }.background(RoundedRectangle(cornerRadius: 5)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1538108573, green: 0.07712940528, blue: 0.2855395904, alpha: 1)), Color(#colorLiteral(red: 0.5, green: 0.3684665896, blue: 0.4267031192, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
