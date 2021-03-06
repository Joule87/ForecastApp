//
//  CityNameView.swift
//  ForecastApp
//
//  Created by Julio Collado on 3/7/21.
//

import SwiftUI

struct CityNameView: View {
    var city: String
    var date: String
    
    var body: some View {
        HStack {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
                Text(city)
                    .font(.title)
                    .bold()
                Text(date)
            }
            .foregroundColor(.white)
            .padding()
        }
    }
}

struct CityNameView_Previews: PreviewProvider {
    static var previews: some View {
        CityNameView(city: "Montevideo", date: "03/20/2010")
    }
}
