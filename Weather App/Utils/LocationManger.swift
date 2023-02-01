//
//  LocationManger.swift
//  Weather App
//
//  Created by Xolani Vilalakazi on 2023/01/30.
//


import CoreLocation

import Foundation
import CoreLocation

class LocationDataManager : NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    @Published var authorizationStatus: CLAuthorizationStatus?
    @Published var error:String = ""
//    private let locationManager = CLLocationManager()
    @Published var location:CLLocation? = nil
    @Published var isCalled = false
    
    override init() {
        super.init()
        locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        if isCalled == true {
        self.locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:  
            authorizationStatus = .authorizedWhenInUse
            locationManager.requestLocation()
            break
            
        case .restricted:
            authorizationStatus = .restricted
            break
            
        case .denied:
            authorizationStatus = .denied
            break
            
        case .notDetermined:
            authorizationStatus = .notDetermined
            manager.requestWhenInUseAuthorization()
            break
            
        default:
            break
        }
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        // Insert code to handle location updates
//    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.error = error.localizedDescription
        print("error: \(error.localizedDescription)")
    }
    
}

extension LocationDataManager {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            DispatchQueue.main.async {
                self.location = location
                
                manager.stopUpdatingLocation()
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            self.error = error.localizedDescription
            print("error: \(error.localizedDescription)")
        }
    }
    
    func getPlace(for location: CLLocation,
                      completion: @escaping (CLPlacemark?) -> Void) {
            
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { placemarks, error in
                
                guard error == nil else {
                    print("*** Error in \(#function): \(error!.localizedDescription)")
                    completion(nil)
                    return
                }
                
                guard let placemark = placemarks?[0] else {
                    print("*** Error in \(#function): placemark is nil")
                    completion(nil)
                    return
                }
                
                completion(placemark)
            }
        }
}
