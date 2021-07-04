//
//  ClearDaySkyModifier.swift
//  ForecastApp
//
//  Created by Julio Collado on 4/7/21.
//

import SwiftUI

struct ClearDaySkyModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)),Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), Color(#colorLiteral(red: 0.05384169952, green: 0.05530177153, blue: 0.07384111198, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)))
            .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 2, y: 2)
    }
}
