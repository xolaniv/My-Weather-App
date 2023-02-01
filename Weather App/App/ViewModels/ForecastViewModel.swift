//
//  ForecastViewModel.swift
//  Weather App
//
//  Created by Xolani Vilalakazi on 2023/01/26.
//

import Foundation
import Combine

class ForecastViewModel: ObservableObject {
    @Published var forecast = [Forecast]()
    @Published var errorMessage = ""
    @Published var showloading = true
    var cancelable: Set<AnyCancellable> = []
    var locationManager = LocationDataManager()
    private var subscriber: AnyCancellable?
    
    var latitude: Double {
        locationManager.location?.coordinate.latitude ?? 0.0
    }
    var longitude: Double {
        return locationManager.location?.coordinate.longitude ?? 0.0
    }
    
    init(locationManager: LocationDataManager) {
        self.locationManager = locationManager
        subscriber = locationManager.$location
            .receive(on: DispatchQueue.main)
            .sink { [weak self] location in
                guard location != nil else { return }
                self?.getForecast()
            }
    }
    
    public func getForecast() {
        showloading = true
        APIClient.dispatch(
            ApiRouter.GetForecast(queryParams: APIParameters.ForecastParameters(lon: longitude, lat: latitude, appid: Keys.apiKey))
        ).sink { _ in
        } receiveValue: { [weak self] forecast in
            DispatchQueue.main.async {
                self?.forecast = forecast.list.firstUniqueElements({ seq in
                    self?.setDate(dt: seq.dt)
                })
            }
        }.store(in: &cancelable)
        showloading = false
        self.locationManager.isCalled = true
        locationManager.isCalled = true
    }
    
    func setDate(dt:Int) -> String {
        let weekDay:String
        let date:Double = Double(dt)
        let unixConvertedDate = Date(timeIntervalSince1970: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.timeStyle = .none
        weekDay = unixConvertedDate.dayOfTheWeek()
        return weekDay
    }
    
}

