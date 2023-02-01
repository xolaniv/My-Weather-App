//
//  WeatherViewModel.swift
//  Weather App
//
//  Created by Xolani Vilalakazi on 2023/01/26.
//

import Foundation
import CoreLocation
import Combine

class WeatherViewModel: ObservableObject {
    @Published var showloading = true
    @Published var errorMessage = ""
    var cancelable: Set<AnyCancellable> = []
    private var subscriber: AnyCancellable?
    @Published var  weather = ""
    @Published var condition = ""
    var maxTemp  = 0
    var minTemp = 0
    @Published var currentWeather = 0
    var date:Int = 0
    
    var locationManager = LocationDataManager()

    init(locationManager: LocationDataManager) {
        self.locationManager = locationManager
        subscriber = locationManager.$location
            .receive(on: DispatchQueue.main)
            .sink { [weak self] location in
                guard location != nil else { return }
                self?.getCurrentWeather()
            }
    }
    var latitude: Double {
        locationManager.location?.coordinate.latitude ?? 0.0
    }
    var longitude: Double {
        return locationManager.location?.coordinate.longitude ?? 0.0
    }
    
    
    func getCurrentWeather() {
        showloading = true
        APIClient.dispatch(
            ApiRouter.GetCurrentWeather(queryParams: APIParameters.WeatherParameters(lon: longitude, lat: latitude, appid: Keys.apiKey))
        ).sink { _ in
        } receiveValue: { [weak self] w in
            self?.condition = w.weather.first?.main ?? ""
            self?.weather = String(w.main.temp)
            self?.minTemp = Int(w.main.temp_min)
            self?.maxTemp = Int(w.main.temp_min)
            self?.currentWeather = Int(w.main.temp)
            self?.date = w.dt
        }.store(in: &cancelable)
        self.locationManager.isCalled = true
        locationManager.isCalled = true
        showloading = false
    }
    
}
