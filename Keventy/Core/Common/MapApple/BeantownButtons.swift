//
//  BeantownButtons.swift
//  Keventy
//
//  Created by Kul Boonanake on 26/2/24.
//

import SwiftUI
import MapKit

struct BeantownButtons: View {
    @Binding var position: MapCameraPosition
    @Binding var searchResults: [MKMapItem]
    
    var visibleRegion: MKCoordinateRegion?
    
    func search(for query: String){
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = visibleRegion ?? MKCoordinateRegion(
            center: .kasetsart,
            span: MKCoordinateSpan(latitudeDelta: 13.8476, longitudeDelta: 100.5696)
        )
        
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            searchResults = response?.mapItems ?? []
        }
        
    }
    
    var body: some View {
        HStack {
            Button {
                search(for: "KasetSart")
            } label: {
                Label("Beaches", systemImage: "beach.umbrella")
            }
            .buttonStyle(.borderedProminent)
            Button {
                search(for: "test")
            } label: {
                Label("test", systemImage: "beach.umbrella")
            }
            .buttonStyle(.borderedProminent)
            Button {
                position = .region(.kasetsart)
            } label: {
                Label("Kasetsart", systemImage: "building.2")
            }
            .buttonStyle(.bordered)
            Button {
                position = .camera(.kasetsart)
            } label: {
                Label("Kasetsart", systemImage: "building.2")
            }
            .buttonStyle(.bordered)
        }
        .labelStyle(.iconOnly)
        
    }
}
