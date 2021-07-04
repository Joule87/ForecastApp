//
//  MenuHeaderView.swift
//  ForecastApp
//
//  Created by Julio Collado on 3/7/21.
//

import SwiftUI

struct MenuHeaderView: View {
    
    @ObservedObject var cityViewModel: CityViewModel
    
    @State private var searchTerm = "Montevideo"
    
    var body: some View {
        HStack {
            TextField("", text: $searchTerm)
                .padding(.leading, 20)
            Button(action: {
                cityViewModel.city = searchTerm
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                    Image(systemName: "location.fill")
                }
            }).frame(width: 50, height: 50)
        }.foregroundColor(Color.white)
        .padding()
        .background(ZStack (alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.5))
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.white)
                .padding(.leading, 10)
        })
    }
}

struct MenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MenuHeaderView(cityViewModel: CityViewModel())
    }
}
