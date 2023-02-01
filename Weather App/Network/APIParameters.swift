//
//  APIParameters.swift
//  Weather App
//
//  Created by Xolani Vilalakazi on 2023/01/31.
//

import Foundation

protocol DictionaryCoveter : Codable {}

struct APIParameters {
    struct WeatherParameters:Codable {
        var lon:Double
        var lat:Double
        var appid:String
        var units:String = "metric"
    }
    struct ForecastParameters:Codable {
        var lon:Double
        var lat:Double
        var appid:String
        var units:String = "metric"
    }
}
