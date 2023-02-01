//
//  WeatherViewModelTests.swift
//  Weather AppTests
//
//  Created by Xolani Vilalakazi on 2023/01/30.
//

import XCTest
@testable import Weather_App

final class WeatherViewModelTests: XCTestCase {
    var viewModel = WeatherViewModel(locationManager: LocationDataManager())
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    override func tearDown() {
        
    }
    
    func test_get_weather_successful() {
        viewModel.getCurrentWeather()
        let seconds = 4.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            XCTAssertEqual(self.viewModel.weather.count , 1)
        }
    }
     
    func test_weather_empty() {
        XCTAssertEqual(0,viewModel.weather.count)
        
    }
    
    func test_weather_failed() {
        XCTAssertEqual(0,viewModel.weather.count)
        XCTAssertEqual(0, viewModel.maxTemp)
        XCTAssertEqual(0, viewModel.minTemp)
        XCTAssertEqual("", viewModel.weather)
        
    }
    
    func test_weather_succesful() {
        viewModel.getCurrentWeather()
        let seconds = 4.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            XCTAssert(self.viewModel.weather !=  "")
        }
    }
}
