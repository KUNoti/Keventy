//
//  MapExploreView.swift
//  Keventy
//
//  Created by Kul Boonanake on 26/2/24.
//

import SwiftUI
import MapKit
import Kingfisher

extension CLLocationCoordinate2D {
    static let kasetsart = CLLocationCoordinate2D(latitude: 13.8476, longitude: 100.5696)
}

extension MapCamera {
    static let kasetsart = MapCamera(
        centerCoordinate: .kasetsart, distance: 1000, heading: 0, pitch: 60
    )
}


struct MapExploreView: View {
    @State private var position: MapCameraPosition = .camera(.kasetsart)
    @State private var selectedResult: MKMapItem?
    var body: some View {
        Map(position: $position, selection: $selectedResult) {
            Annotation("test", coordinate: .kasetsart) {
                ZStack {
                    KFImage(URL(string: "https://mpics.mgronline.com/pics/Images/560000007342901.JPEG"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.purple, lineWidth: 2))
                        .frame(width: 40, height: 40)
                }
                .frame(width: 40, height: 40)
            }
        }
    }
}

#Preview {
    MapExploreView()
}
