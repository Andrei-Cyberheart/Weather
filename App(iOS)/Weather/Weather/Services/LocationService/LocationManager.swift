//
//  LocationService.swift
//  Weather
//
//  Created by Andrei Ulanov on 18.07.2023.
//

import CoreLocation
import Foundation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let locationManager: CLLocationManager
    
    @Published var latitude: CLLocationDegrees = 0
    @Published var longitude: CLLocationDegrees = 0
    @Published var city: String = "Cupertino"
    @Published var degree: Double = 0.0
    

    override init() {
        self.locationManager = CLLocationManager()
        super.init()

        self.locationManager.delegate = self
        self.setup()
    }

    private func setup() {
        self.locationManager.requestWhenInUseAuthorization()

        self.locationManager.startUpdatingLocation()
        self.locationManager.startUpdatingHeading()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            latitude = location.coordinate.latitude
            longitude = location.coordinate.longitude
            CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude)) { [weak self] (placemarks, error) in
                if let error {print("Reverse geodcode fail: \(error.localizedDescription)")}
                if error == nil, let placemarks {
                    self?.city = placemarks[0].locality ?? "N/A"
                }
            }
            }
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        degree = newHeading.magneticHeading
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        latitude = 37.19
        longitude = 122.01
        degree = 0.0
    }
}
