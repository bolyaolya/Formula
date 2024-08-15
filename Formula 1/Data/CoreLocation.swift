//
//  CoreLocation.swift
//  Formula 1
//
//  Created by Olya Boyko on 17.07.2024.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {    
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?
    @Published var userTimeZone: TimeZone?
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            manager.startUpdatingLocation()
        case .denied, .restricted:
            print("Location access denied")
        default:
            print("Location access not determined")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        userLocation = location
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard error == nil, let placemark = placemarks?.first else {
                print("Reverse geocoding error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            if let timeZone = placemark.timeZone {
                self.userTimeZone = timeZone
                print("User time zone: \(timeZone.identifier)")
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
    }
}
