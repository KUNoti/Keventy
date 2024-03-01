//
//  MapLocation.swift
//  Keventy
//
//  Created by Kul Boonanake on 1/3/24.
//

import CoreLocation


struct MapLocation: Identifiable {
    let coordinate: CLLocationCoordinate2D
    
    var id: String {
        coordinate.description
    }
    
    var text: String {
        coordinate.description
    }
}

