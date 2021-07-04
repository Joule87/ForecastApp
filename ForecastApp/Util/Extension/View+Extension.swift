//
//  View+Extension.swift
//  ForecastApp
//
//  Created by Julio Collado on 4/7/21.
//

import SwiftUI

extension View {
    func clearDaySkyBackgroundStyle() -> some View {
        self.modifier(ClearDaySkyModifier())
    }
}

