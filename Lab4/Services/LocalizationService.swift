//
//  LocalizationService.swift
//  Lab4
//
//  Created by María Espejo on 23/5/24.
//

import Foundation
import CoreLocation

protocol LocalizationServiceProtocol {
    func requestLocation(completion: @escaping (String, String?) -> Void)
}


class LocalizationService: NSObject, CLLocationManagerDelegate, LocalizationServiceProtocol {
    private let locationManager = CLLocationManager()
    private var completion: ((String, String) -> Void)?
    
    
    
    func requestLocation(completion: @escaping (String, String?) -> Void) {
        self.completion = completion
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.first else { return }
            let locationString = "\(location.coordinate.latitude), \(location.coordinate.longitude)"
            
            reverseGeocodeLocation(location) { [weak self] placeName in
                self?.completion?(locationString, placeName ?? "")
            }
        }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location: \(error.localizedDescription)")
    }
    
    private func reverseGeocodeLocation(_ location: CLLocation, completion: @escaping (String?) -> Void) {
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { placemarks, error in
                if let error = error {
                    print("Geocoding error: \(error)")
                    completion(nil)
                } else if let city = placemarks?.first?.locality {
                    completion(city)
                } else {
                    completion("Unknown location")
                }
            }
        }
    
}

