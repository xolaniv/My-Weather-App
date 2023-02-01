//
//  DateTimeHelper.swift
//  Weather App
//
//  Created by Xolani Vilalakazi on 2023/01/28.
//

import Foundation

class DateTimeHelper {
    static func setDate(dt:Int) -> String {
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
    
    static func setTime(dt:Int) -> String {
        let weekDay:String
        let date:Double = Double(dt)
        let unixConvertedDate = Date(timeIntervalSince1970: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.timeStyle = .none
        weekDay = unixConvertedDate.time()
        return weekDay
    }
}

extension Sequence where Element: Equatable {
  func containsDuplicates() -> Bool {
    var alreadySeen: [Element] = []
    
    for element in self {
      if alreadySeen.contains(element) {
        return true
      }
      alreadySeen.append(element)
    }
    
    return false
  }
}
