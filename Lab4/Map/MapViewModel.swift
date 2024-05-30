//
//  MapViewModel.swift
//  Lab4
//
//  Created by María Espejo on 23/5/24.
//

import Foundation
import Combine
import MapKit

class MapViewModel: ObservableObject {
    @Published var region: MKCoordinateRegion
    
    init(city: String) {
        self.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.416775, longitude: -3.703790), // Default to Madrid
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        getCoordinate(for: city) { coordinate in
            if let coordinate = coordinate {
                self.region = MKCoordinateRegion(
                    center: coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                )
            }
        }
    }
    
    func getCoordinate(for address: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            if let placemarks = placemarks, let location = placemarks.first?.location {
                completion(location.coordinate)
            } else {
                completion(nil)
            }
        }
    }
}
