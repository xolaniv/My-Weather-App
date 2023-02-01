//
//  DetailedWeatherView.swift
//  Weather App
//
//  Created by Xolani Vilalakazi on 2023/01/28.
//

import SwiftUI

struct DetailedWeatherView: View {
    var detailedWeather:Forecast
    var condition:String
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    HStack {
                        ImageHelper.setImageConditionDetailed(condition: condition)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
    
                        VStack {
                            Text("\(Int(detailedWeather.main.temp ?? 0))°")
                                .font(.system(size: 35))
                                .foregroundColor(.white)
                            Text("\(DateTimeHelper.setDate(dt:detailedWeather.dt))")
                                .font(.system(size: 30))
                        }
                        
                        
                    }.foregroundColor(.white)
                
                    
                    Text(condition)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    
                    HStack {

                        
                    }.font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                    
                    Divider()
                        .foregroundColor(.white)
                    
                    VStack {
                        Text("Pressure")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                        
                        Text("\(Int(detailedWeather.main.pressure ?? 0)) %")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                        
                    }
                    
                    Divider()
                    
                    VStack {
                        Text("Sea Level")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                        
                        Text("\(Int(detailedWeather.main.sea_level ?? 0)) %")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                    }
                    
                    Divider()
                    
                    VStack {
                        Text("Humidity")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                            
                        Text("\(Int(detailedWeather.main.humidity ?? 0)) %")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                    }
                    
                }
                Divider()
                
            }.background(
                Color(.lightGray)
                    .ignoresSafeArea()
            )
        }
    }
}
    
    struct DetailedWeatherView_Previews: PreviewProvider {
        static var previews: some View {
            DetailedWeatherView(detailedWeather: .init(dt: 1675104684, main: Forecast.Main(), weather: [WeatherModel]()), condition: "Clouds")
        }
    }
