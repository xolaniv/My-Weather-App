//
//  LocationsView.swift
//  Weather App
//
//  Created by Xolani Vilalakazi on 2023/01/31.
//

import SwiftUI

struct LocationsView: View {
    @ObservedObject var locationsViewModel = LocationsViewModel()
    var locationManager = LocationDataManager()
    var body: some View {
        VStack {
            Text("Locations")
                .font(.system(size: 50, weight: .semibold))
            Spacer()
            if locationsViewModel.Locations.isEmpty {
                Text("No locations stored on app")
                    .font(.system(size: 34, weight: .regular))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            else {
                List(locationsViewModel.Locations, id: \.id) { result in
                    Text(result.weather.first?.main ?? "")
                }
            }
            
            Spacer()
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
