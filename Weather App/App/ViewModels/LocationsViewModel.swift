//
//  LocationsViewModel.swift
//  Weather App
//
//  Created by Xolani Vilalakazi on 2023/02/01.
//

import Foundation
import CoreLocation
import Combine

class LocationsViewModel: ObservableObject {
    var locationManager = LocationDataManager()
    @Published var Locations = [WeatherCache]()
    @Published var errorMessage = ""
    @Published var showloading = true
    @Published var currentPlacemark: [CLPlacemark]?
    var cancelable: Set<AnyCancellable> = []
    
}
    
