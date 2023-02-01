//
//  ForecastViewModelTests.swift
//  Weather AppTests
//
//  Created by Xolani Vilalakazi on 2023/01/30.
//

import XCTest
import Combine
@testable import Weather_App

final class ForecastViewModelTests: XCTestCase {
    var viewModel = ForecastViewModel(locationManager: LocationDataManager())
    
    
    func test_get_forecast_successful() {
        viewModel.getForecast()
        let seconds = 4.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            XCTAssertEqual(self.viewModel.forecast.count , 1)
        }
    }
    
    func test_forcast_empty() {
        XCTAssertEqual(0,viewModel.forecast.count)
    }
    
    func test_setDate_successful() {
        XCTAssertEqual(Optional("Monday"), viewModel.setDate(dt: 1675104684))
    }
    

}
