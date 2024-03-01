//
//  MapContainer.swift
//  Keventy
//
//  Created by Kul Boonanake on 1/3/24.
//

import SwiftUI
import MapKit
import Kingfisher

struct MapContainer: View {
    
    @EnvironmentObject var mapViewModel: MapViewModel
    @EnvironmentObject var locationManager: LocationBaseManager
    @Environment(EventModel.self) private var viewModel
    @State private var selectedEvent: Event?
    
    var body: some View {
        ZStack {
            Map {
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
            }.mapControls {
                MapUserLocationButton()
                MapCompass()
                MapScaleView()
            }
        }
        .task {
            mapViewModel.addEventAnnotations(viewModel.events ?? [])
            
//            self.arSessionManager.add(location: Placemark(coordinate: coordinate, accuracy: 0, placeName: anchorName))
            
        }
        .alert(isPresented: $locationManager.permissionDenied, content: {
            .openSettingsAlert(title: "Persmission Denied", message: "Enable Location Tracking in Settings")
        })
        .alert(isPresented: $locationManager.accuracyDenied, content: {
            .openSettingsAlert(title: "Persmission Denied", message: "Enable Full Accuracy Tracking in Settings")
        })
    }
}

#Preview {
    MapContainer()
}
