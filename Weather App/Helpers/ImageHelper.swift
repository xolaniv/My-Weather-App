//
//  ImageHelper.swift
//  Weather App
//
//  Created by Xolani Vilalakazi on 2023/01/26.
//

import Foundation
import SwiftUI

public class ImageHelper {
    static func setImageCondition(condition:String) -> Image {
         switch condition {
         case "Clouds" :
             return Image("clear")
                 .renderingMode(.template)
         case "Rain" :
             return Image("rain")
                 .renderingMode(.template)
         case "Clear" :
             return Image("clear")
                 .renderingMode(.template)
         case "Snow" :
             return Image(systemName: "cloud.snow.fill")
                 .renderingMode(.original)
         case "Mist" :
             return Image(systemName: "cloud.snow.fill")
                 .renderingMode(.original)
         default:
             return Image(systemName: "cloud.bolt.rain")
             
         }
     }
    
    static func setImageConditionDetailed(condition:String) -> Image {
         switch condition {
         case "Clouds" :
             return Image(systemName: "cloud.sun.fill")
                 .renderingMode(.template)
         case "Rain" :
             return Image(systemName: "cloud.bolt.rain.fill")
                 .renderingMode(.template)
         case "Clear" :
             return Image(systemName: "sun.max.fill")
                 .renderingMode(.template)
         case "Snow" :
             return Image(systemName: "cloud.snow.fill")
                 .renderingMode(.original)
         case "Mist" :
             return Image(systemName: "cloud.snow.fill")
                 .renderingMode(.original)
         default:
             return Image(systemName: "cloud.bolt.rain")
             
         }
     }
    enum BackgrounColor:String {
            case Clear = "Sunny"
            case Rainy = "Rainy"
            case Cloudy = "Cloudy"
        }
    
    enum BackgroundImage:String {
           case Clear = "sea-sunny"
           case Rainy = "sea-rainy"
           case Cloudy = "sea-cloudy"
       }
    
    static func returnBackgroundImage(codition:String) -> String {
          switch (codition){
          case "Clear" :
              return BackgroundImage.Clear.rawValue
          case "Rain":
              return BackgroundImage.Rainy.rawValue
          case "Clouds":
              return BackgroundImage.Cloudy.rawValue
          default:
              return BackgroundImage.Clear.rawValue
          }
      
      }
    
    static func returnBackgroundColor(codition:String) -> String {
          switch (codition){
          case "Clear" :
              return BackgrounColor.Clear.rawValue
          case "Rain":
              return BackgrounColor.Rainy.rawValue
          case "Clouds":
              return BackgrounColor.Cloudy.rawValue
          default:
              return BackgrounColor.Clear.rawValue
          }
      
      }
}
