//
//  TabView.swift
//  Weather App
//
//  Created by Xolani Vilalakazi on 2023/01/31.
//

import SwiftUI

struct TabyView: View {
    var body: some View {
        TabView {
            WeatherView(forcastViewModel: ForecastViewModel(locationManager: LocationDataManager()), weatherViewModel: WeatherViewModel(locationManager: LocationDataManager()))
                .tabItem {
                    Label("Weather", systemImage: "cloud.sun.rain")
                    Text("Weather")
                }
                .foregroundColor(.white)
            
            LocationsView()
                .tabItem {
                    Label("Locations", systemImage: "list.star")
                        .foregroundColor(.white)
                    Text("Editor")
                            .foregroundColor(.white)
                }
                .foregroundColor(.white)
         
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabyView()
    }
}
