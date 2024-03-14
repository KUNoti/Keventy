//
//  HomeView.swift
//  Keventy
//
//  Created by Kul Boonanake on 11/3/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedEvent: Event?
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("ARContainer")
                    .frame(width: geometry.size.width, height: geometry.size.height * 2/3)
                MapView(selectedEvent: $selectedEvent)
                    .frame(width: geometry.size.width, height: geometry.size.height * 3/3)
            }
        }
    }
}

#Preview {
    HomeView()
}
