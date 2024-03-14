//
//  MapExploreView.swift
//  Keventy
//
//  Created by Kul Boonanake on 26/2/24.
//

import SwiftUI
import MapKit
import Kingfisher

struct MapExploreView: View {
    @State private var position: MapCameraPosition = .camera(.kasetsart)
    @State private var selectedEvent: Event?
    var events: [Event]?
    @State private var searchResults: [Event]?
    
    var body: some View {
        ZStack {
            VStack {
                Map(position: $position) {
                    ForEach(searchResults ?? []) { event in
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
                
                BeanTagButtons(events: events, searchResults: $searchResults, selectedEvent: $selectedEvent)
            }
        }
        .task {
            self.searchResults = self.events
        }
    }
}



