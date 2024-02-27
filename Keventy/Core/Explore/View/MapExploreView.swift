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
    @State private var selectedEvent: Event?
    var events: [Event]?
    
    
    var body: some View {
        ZStack {
            VStack {
                Map(position: $position) {
                    ForEach(events ?? []) { event in
                        Annotation(
                            event.title,
                            coordinate: CLLocationCoordinate2D(
                                latitude: event.latitude,
                                longitude: event.longitude
                            )
                        ) {
                            ZStack {
                                KFImage(event.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.purple, lineWidth: 2))
                                    .frame(width: selectedEvent == event ? 60 : 40, height: selectedEvent == event ? 60 : 40)
                            }
                            .animation(Animation.spring)
                            .onTapGesture {
                                selectedEvent = event
                            }
                        }
                    }
                }.mapControls {
                    MapUserLocationButton()
                    MapCompass()
                    MapScaleView()
                }
                Spacer()
                if selectedEvent != nil {
                    EventCardView(event: selectedEvent!)
                }
            }
        }
    }
}


