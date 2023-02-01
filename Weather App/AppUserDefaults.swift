//
//  UserDefaults.swift
//  Weather App
//
//  Created by Xolani Vilalakazi on 2023/01/31.
//

import Foundation

class AppUserDefaults {
    public var getWeatherCache: [WeatherCache] {
          let defaultObject = [WeatherCache]()
          if let objects = UserDefaults.standard.value(forKey: "weatherFavs") as? Data {
             let decoder = JSONDecoder()
             if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [WeatherCache] {
                return objectsDecoded
             } else {
                return defaultObject
             }
          } else {
             return defaultObject
          }
    }
}

public func clearAllCache() {
    let defaults = UserDefaults.standard
    defaults.set(nil, forKey: "weatherFavs")
}
