//
//  SwitchButton.swift
//  WeatherSwiftUIApp
//
//  Created by Айдин Абдурахманов on 24.04.2021.
//

import SwiftUI

struct SwitchButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 250, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
