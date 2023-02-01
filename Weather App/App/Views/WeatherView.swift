//
//  WeatherView.swift
//  Weather App
//
//  Created by Xolani Vilalakazi on 2023/01/31.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var forcastViewModel:ForecastViewModel
    @ObservedObject var weatherViewModel: WeatherViewModel
    @State var showAnimation = false
    
    var body: some View {
        NavigationView {
        ScrollView {
            VStack{
                ZStack {
                    Image(ImageHelper.returnBackgroundImage(codition: weatherViewModel.condition))
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .ignoresSafeArea(.all)
                    VStack {
                        Spacer()
                        Text("\(weatherViewModel.currentWeather)°")
                            .font(.system(size: 50, weight: .semibold))
                        Text(weatherViewModel.condition)
                            .font(.system(size: 30, weight: .medium))
                        Spacer()
                    }
                    .foregroundColor(.white)
                    if weatherViewModel.showloading == true {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                            .scaleEffect(2)
                    }
                }
                Spacer()
                
                VStack {
                    HStack {
                        VStack {
                            Text("\(weatherViewModel.minTemp)°")
                                .font(.system(size: 15, weight: .semibold))
                            Text("min")
                        }
                        .padding(.leading)
                        
                        Spacer()
                        
                        VStack {
                            Text("\(weatherViewModel.currentWeather)°")
                                .font(.system(size: 15, weight: .semibold))
                            Text("current")
                        }
                        Spacer()
                        VStack {
                            Text("\(weatherViewModel.maxTemp)°")
                                .font(.system(size: 15, weight: .semibold))
                            Text("max")
                        }
                        .padding(.trailing)
                    }
                    .foregroundColor(.white)
                    Divider()
                        .background(Color.blue)
                        .overlay(.white)
                    ForEach(forcastViewModel.forecast, id: \.id) { result in
                        VStack {
                            let condition = result.weather.map() {$0.main}
                            
                            NavigationLink(
                                destination: DetailedWeatherView(detailedWeather: result, condition: condition[0] ?? ""),
                                label: {
                                    HStack {
                                        let temp = result.weather.map() {$0.main}
                                        let dayOfWeek = forcastViewModel.setDate(dt: result.dt)
                                        if dayOfWeek == forcastViewModel.setDate(dt: weatherViewModel.date ) {
                                            
                                            Text("Today")
                                                .foregroundColor(.white)
                                                .frame(width: 105, alignment: .leading)
                                                .padding(.leading)
                                        }
                                        else {
                                            Text(dayOfWeek)
                                                .foregroundColor(.white)
                                                .frame(width: 105, alignment: .leading)
                                                .padding(.leading)
                                        }
                                        Spacer()
                                        ImageHelper.setImageCondition(condition: temp[0] ?? "")
                                            .resizable()
                                            .frame(width: 35, height: 35, alignment: .center)
                                            .foregroundColor(.white)
                                            .padding(.trailing,50)
                                        
                                        
                                        Spacer()
                                        Text("\(Int(result.main.temp ?? 0))°")
                                            .foregroundColor(.white)
                                            .padding(.trailing)
                                    }
                                })
                            
                            .padding(.bottom, 5)
                        }
                        
                    }
                }
                
            }
        }
        .background(
            Color(ImageHelper.returnBackgroundColor(codition: weatherViewModel.condition)
                 )
        ).ignoresSafeArea()
    }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(forcastViewModel: .init(locationManager: LocationDataManager()), weatherViewModel: WeatherViewModel(locationManager: LocationDataManager()))
    }
}
