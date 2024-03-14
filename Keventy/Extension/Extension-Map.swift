//
//  Map.swift
//  Keventy
//
//  Created by Kul Boonanake on 11/3/24.
//

import MapKit
import SwiftUI

extension CLLocationCoordinate2D {
    static let kasetsart = CLLocationCoordinate2D(latitude: 13.8476, longitude: 100.5696)
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 13.8517, longitude: 100.5678)
    }
}

extension MapCamera {
    static let kasetsart = MapCamera(
        centerCoordinate: .kasetsart, distance: 1000, heading: 0, pitch: 60
    )
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .userLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
}
