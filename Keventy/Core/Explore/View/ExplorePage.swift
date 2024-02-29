//
//  ExplorePage.swift
//  Keventy
//
//  Created by Kul Boonanake on 23/2/24.
//

import SwiftUI

struct ExplorePage: View {
    //    @State private var events: [Event]? = nil
    @State private var isLoading = false
    @State private var error: Error?
    @State private var selectedDate = Date()
    
//    private var viewModel = EventModel()
    @Environment(EventModel.self) private var viewModel

    
    var body: some View {
        VStack {
            TimeSelectionView(selectedDate: $selectedDate)
            Spacer()
            if viewModel.events != nil {
                MapExploreView(events: viewModel.events)
            } else if isLoading {
                ProgressView()
            } else if let error = error {
                Text("Error: \(error.localizedDescription)")
            } else {
                Text("No events available.")
            }
        }
        .onChange(of: viewModel.events) { oldValue, newValue in
//            viewModel.filteredEvents(selectedDate: selectedDate)
        }
    }
}

#Preview {
    ExplorePage()
}

