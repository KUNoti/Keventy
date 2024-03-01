//
//  HomeView.swift
//  Keventy
//
//  Created by Kul Boonanake on 1/3/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var locationManager: LocationBaseManager
    @EnvironmentObject var mapViewModel: MapViewModel
    @EnvironmentObject var arSessionManager: ARSessionManager
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // AR Container 2/3 of total screen size
                // Map Container 1/3 of total screen size
                
                ARContainer()
                    .frame(width: geometry.size.width, height: geometry.size.height * 2/3)
                MapContainer()
                    .frame(width: geometry.size.width, height: geometry.size.height * 1/3)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: {
            
            // imitate loading
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.arSessionManager.loadCachedAnchors()
            }
            
            arSessionManager.addCallback = mapViewModel.addAnchors(_:)
            arSessionManager.removeCallback = mapViewModel.removeAnchors(_:)
            
            locationManager.onStart = mapViewModel.focusOnUserLocation
            locationManager.start()
            
            locationManager.onLocationChanged = arSessionManager.receive(location:)
            arSessionManager.configure(locationManager)
        })
        .onDisappear(perform: {
            locationManager.stop()
        })
    }
}

#Preview {
    HomeView()
}
