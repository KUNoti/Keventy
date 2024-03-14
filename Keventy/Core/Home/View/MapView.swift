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
    
    //MARK: - Properties
    @State private var cameraPosition: MapCameraPosition = .camera(.kasetsart)
    @Binding var selectedEvent: Event?
    @Environment(EventModel.self) private var viewModel
    @State private var mapSelection: MKMapItem?
    @State private var showDetails = false
    @State private var getDirections = false
    @State private var routeDisplaying = false
    @State private var route: MKRoute?
    @State private var routeDestination: MKMapItem?
    
    //MARK: - View
    var body: some View {
        Map(position: $cameraPosition, selection: $mapSelection) {
            
            // User Location Mock
            Annotation("My location", coordinate: .userLocation) {
                ZStack {
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.blue.opacity(0.25))
                    
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    
                    Circle()
                        .frame(width: 12, height: 12)
                        .foregroundColor(.blue)
                }
            }
            
            // List of Events's Marker
            ForEach(viewModel.events ?? []) { event in
//                if routeDisplaying {
//                    if item == routeDestination {
//                        let placemark = item.placemark
//                        Marker(placemark.name ?? "", coordinate: placemark.coordinate)
//                    }
//                } else {
//                    let placemark = item.placemark
//                    Marker(placemark.name ?? "", coordinate: placemark.coordinate)
//                }
                if routeDisplaying {
                    if event.mapItem() == routeDestination {
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
                                    .frame(width: selectedEvent == event ? 30 : 20, height: selectedEvent == event ? 30 : 20)
                            }
                            .animation(Animation.spring)
                            .onTapGesture {
                                selectedEvent = event
                            }
                        }
                    }
                } else {
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
                                .frame(width: selectedEvent == event ? 30 : 20, height: selectedEvent == event ? 30 : 20)
                        }
                        .animation(Animation.spring)
                        .onTapGesture {
                            selectedEvent = event
                        }
                    }
                }
                
            }
            
            if let route {
                MapPolyline(route.polyline)
                    .stroke(.blue, lineWidth: 6)
            }
            
        }.mapControls {
            MapUserLocationButton()
            MapCompass()
            MapPitchToggle()
        }
        .onChange(of: getDirections, { oldValue, newValue in
            if newValue {
                fetchRoute()
            }
        })
        .onChange(of: selectedEvent, { oldValue, newValue in
            showDetails = newValue != nil
            if let event = newValue {
                mapSelection = event.mapItem()
//                print("\(mapSelection)")
            } else {
                mapSelection = nil
            }
        })
        .sheet(isPresented: $showDetails, content: {
            LocationDetailsView(selectevent: $selectedEvent, show: $showDetails, getDirections: $getDirections)
                .presentationDetents([.height(340)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(340)))
                .presentationCornerRadius(12)
        })
    }
}

extension MapView {
    func fetchRoute() {
        if mapSelection != nil {
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: .init(coordinate: .userLocation))
            request.destination = mapSelection
            
            Task {
                let result = try? await MKDirections(request: request).calculate()
                route = result?.routes.first
                print("\(route)")
                routeDestination = mapSelection
                
                withAnimation(.snappy) {
                    routeDisplaying = true
                    showDetails = false
                    
                    if let rect = route?.polyline.boundingMapRect, routeDisplaying {
                        cameraPosition = .rect(rect)
                    }
                }
            }
        }
    }
}

#Preview {
    MapView(selectedEvent: .constant(nil))
}
