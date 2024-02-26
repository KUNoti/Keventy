//
//  ARViewContainer.swift
//  Keventy
//
//  Created by Kul Boonanake on 23/2/24.
//

import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    @EnvironmentObject var viewModel: ViewModel
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap)))
        
        context.coordinator.view = arView
        return arView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(viewModel: viewModel)
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
