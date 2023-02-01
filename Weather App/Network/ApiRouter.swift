//
//  ApiRouter.swift
//  Weather App
//
//  Created by Xolani Vilalakazi on 2023/01/31.
//

import Foundation

class ApiRouter {
    struct GetCurrentWeather:Request {
        typealias ReturnType = WeatherResponse
        var path: String = "/weather"
        var method: HTTPMethod = .get
        var queryParams: [String : Any]?
        init(queryParams: APIParameters.WeatherParameters) {
                    self.queryParams = queryParams.asDictionary
            
        }
    }
    
    struct GetForecast: Request {
        typealias ReturnType = ForecastResponse
        var path: String = "/forecast"
        var method: HTTPMethod = .get
        var queryParams: [String : Any]?
        init(queryParams: APIParameters.ForecastParameters) {
            self.queryParams = queryParams.asDictionary
        }
    }

}
