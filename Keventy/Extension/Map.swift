//
//  Map.swift
//  Keventy
//
//  Created by Kul Boonanake on 11/3/24.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let kasetsart = CLLocationCoordinate2D(latitude: 13.8476, longitude: 100.5696)
}

extension MapCamera {
    static let kasetsart = MapCamera(
        centerCoordinate: .kasetsart, distance: 1000, heading: 0, pitch: 60
    )
}

extension MKMapCamera {
    static let kasetsart = MKMapCamera(
        lookingAtCenter: CLLocationCoordinate2D(latitude: 13.8465, longitude: 100.5687),
        fromEyeCoordinate: CLLocationCoordinate2D(latitude: 13.8465, longitude: 100.5687),
        eyeAltitude: 1000
    )
}

