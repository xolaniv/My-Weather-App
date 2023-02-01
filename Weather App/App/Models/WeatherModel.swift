//
//  Weather.swift
//  Weather App
//
//  Created by Xolani Vilalakazi on 2023/01/26.
//

import Foundation
import CoreLocation

struct WeatherResponse:Codable {
    let timezone:Int
    let name:String
    let weather: [WeatherModel]
    let main: Main
    let dt:Int
}

struct WeatherModel:Codable{
    let main:String?
    var description:String?
}

struct Main:Codable {
    let temp:Double
    let humidity:Int
    let temp_min:Double
    let temp_max:Double
    let feels_like:Double
}

struct Weather {
    var condition:String
    var temp:Double
    var tempMin:Double
    var tempMAx:Double
    var presure:Int
    var humidity:Int
    var date:Int
}

public struct WeatherCache : Codable, Identifiable {
    public var id = UUID()
    var latitude: Double
    var longitude: Double
    var weather: [WeatherModel]
}

