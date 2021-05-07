//
//  ContentView.swift
//  WeatherSwiftUIApp
//
//  Created by Айдин Абдурахманов on 23.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroungView(topColor: isNight ? .black : .blue, bottomColor:  isNight ? .gray : Color("lightBlue"))
            VStack {
                CityTextView(cityName: "Makhachkala")
                
                MainStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageView: "cloud.sun.fill", temperature: 88)
                    WeatherDayView(dayOfWeek: "WED", imageView: "sun.max.fill", temperature: 85)
                    WeatherDayView(dayOfWeek: "THU", imageView: "wind.snow", temperature: 57)
                    WeatherDayView(dayOfWeek: "FRI", imageView: "sunset.fill", temperature: 80)
                    WeatherDayView(dayOfWeek: "SAT", imageView: "snow", temperature: 65)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    SwitchButton(title: "Change Day Time",
                                 textColor: .blue,
                                 backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    struct WeatherDayView: View {
        
        var dayOfWeek: String
        var imageView: String
        var temperature: Int
        
        var body: some View {
            VStack {
                Text(dayOfWeek)
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.white)
                Image(systemName: imageView)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("\(temperature)º")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.white)
            }
        }
    }
    
    struct BackgroungView: View {
        
        var topColor: Color
        var bottomColor: Color
        
        var body: some View {
            LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    struct CityTextView: View {
        
        var cityName: String
        
        var body: some View {
            Text(cityName)
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
        }
    }
    
    struct MainStatusView: View {
        
        var imageName: String
        var temperature: Int
        
        var body: some View {
            VStack(spacing: 10) {
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                Text("\(temperature)º")
                    .font(.system(size: 70, weight: .medium))
                    .foregroundColor(.white)
            }
            .padding(.bottom, 40)
        }
    }
}
