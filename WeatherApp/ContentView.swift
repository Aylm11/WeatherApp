//
//  ContentView.swift
//  WeatherApp
//
//  Created by Ali YILMAZ on 19.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityView(cityName: "Istanbul")
                
                MainWeatherView(imageName: isNight ? "moon.fill" : "cloud.sun.fill", temp: 30)
               
                
                HStack(spacing : 20){
                    WeatherDay(dayName: "TUE", temperature: 20, weatherName: "cloud.sun.fill")
                    WeatherDay(dayName: "WED", temperature: 25, weatherName: "cloud.sun.rain.fill")
                    WeatherDay(dayName: "THU", temperature: 27, weatherName: "cloud.rain.fill")
                    WeatherDay(dayName: "FRI", temperature: 22, weatherName: "sun.max.fill")
                    WeatherDay(dayName: "SAT", temperature: 30, weatherName: "cloud.sun.fill")
                }
                
                    Spacer()
                
                Button{
                    isNight.toggle()
                } label : {
                    WeatherButton(title: "Change Day Time", backgroundColor: .white, TextColor: .blue)
                }
                
                Spacer()
            }
            
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDay: View {
    
    var dayName : String
    var temperature : Int
    var weatherName : String
    
    var body: some View {
        VStack{
            Text(dayName)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .medium, design: .default))
            Image(systemName: weatherName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 28, weight: .medium, design: .default))
            
        }
    }
}


struct BackgroundView: View {
    
    @Binding var isNight : Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient( colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
    }
}

struct CityView: View {
    
    var cityName : String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}


struct MainWeatherView: View{
    var imageName : String
    var temp : Int
    
    var body: some View{
        VStack (spacing : 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
                
            
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        
        .padding(.bottom, 150)
    }
}

struct WeatherButton: View {
    
    var title : String
    var backgroundColor : Color
    var TextColor : Color
        
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(TextColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10.0)
    }
}
