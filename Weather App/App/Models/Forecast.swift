//
//  Forecast.swift
//  Weather App
//
//  Created by Xolani Vilalakazi on 2023/01/26.
//

import Foundation

struct ForecastResponse:Codable {
    let cod: String?
    let list:[Forecast]

    enum CodingKeys: String, CodingKey {
        case cod = "cod"
        case list = "list"
    }
}

struct Forecast:Codable, Identifiable{
    let id = UUID()
    var dt:Int
    var main:Main
    var weather:[WeatherModel]
    
    struct Main: Codable{
        var temp:Double?
        var temp_min: Double?
        var temp_max: Double?
        var pressure: Int?
        var sea_level: Int?
        var grnd_level: Int?
        var humidity:Int?
        var temp_kf:Double?
    }

}
