//
//  ExplorePageView.swift
//  Keventy
//
//  Created by Kul Boonanake on 23/2/24.
//

import SwiftUI
import MapKit

struct ExplorePageView: View {

    let test1 = CLLocationCoordinate2D(latitude: 13.8495, longitude: 100.569)
    let test2 = CLLocationCoordinate2D(latitude: 13.853, longitude: 100.566)
    let test3 = CLLocationCoordinate2D(latitude: 13.8517, longitude: 100.5678)
    let test4 = CLLocationCoordinate2D(latitude: 13.8535, longitude: 100.5665)
    let test5 = CLLocationCoordinate2D(latitude: 13.85, longitude: 100.565)
    
    var body: some View {
        VStack {
            TimeSelectionView()
            Spacer()
            Map {
                Marker("test", coordinate: test1)
                Marker("test2", coordinate: test2)
                Marker("test3", coordinate: test3)
                Marker("test4", coordinate: test4)
                Marker("test5", coordinate: test5)
            }
            .mapControlVisibility(.hidden)
        }
    }
}

#Preview {
    ExplorePageView()
}
