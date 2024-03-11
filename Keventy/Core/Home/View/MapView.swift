//
//  MapView.swift
//  Keventy
//
//  Created by Kul Boonanake on 11/3/24.
//

import SwiftUI
import MapKit
import Kingfisher

struct MapView: View {
    @State private var position: MapCameraPosition = .camera(.kasetsart)
    @Environment(EventModel.self) private var viewModel
    @State private var selectedEvent: Event?

    var body: some View {
        Map(position: $position) {
            ForEach(viewModel.events ?? []) { event in
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
        }
        .mapControls {
            MapUserLocationButton()
            MapCompass()
        }
    }
}

#Preview {
    MapView()
}
