//
//  MapView.swift
//  Keventy
//
//  Created by Kul Boonanake on 1/3/24.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @EnvironmentObject var mapViewModel: MapViewModel
    var initialCameraPosition: MKMapCamera
    
    func makeCoordinator() -> Coordinator {
        let coordinator = MapView.Coordinator(self)
        return coordinator
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let view = mapViewModel.mapView
        view.showsCompass = false
        view.showsUserLocation = true
        view.delegate = context.coordinator
        
        // set camera
        view.camera = initialCameraPosition
        
        // fix geometry?
        let compassBtn = MKCompassButton(mapView: view)
        compassBtn.frame.origin = CGPoint(x: 30, y: 30)
        compassBtn.compassVisibility = .visible
        view.addSubview(compassBtn)
        
        return view
        
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    private func setInitialCameraPosition(_ mapView: MKMapView) {
        
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var control: MapView
        
        init(_ control: MapView) {
            self.control = control
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard !annotation.isKind(of: MKUserLocation.self) else { return nil}
            
            let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "PIN")
            pin.tintColor = .systemIndigo
            pin.animatesDrop = true
            pin.canShowCallout = true
            
            return pin
        }
        
        func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode, animated: Bool) {
            print("\(#file) -- didChange mode to \(mode.rawValue)")
            DispatchQueue.main.async {
                self.control.mapViewModel.userTrackingMode = mode
            }
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let anchorOverlay = overlay as? AnchorIndicator {
                let anchorOverlayView = MKCircleRenderer(circle: anchorOverlay)
                anchorOverlayView.strokeColor = .white
                anchorOverlayView.fillColor = anchorOverlay.color
                anchorOverlayView.lineWidth = 2
                return anchorOverlayView
            }
            return MKOverlayRenderer()
        }
    }
}


