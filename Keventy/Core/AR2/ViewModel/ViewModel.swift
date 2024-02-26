//
//  ViewModel.swift
//  Keventy
//
//  Created by Kul Boonanake on 23/2/24.
//

import Foundation
import UIKit
import PencilKit

class ViewModel: ObservableObject{
    @Published var drawing: UIImage?
    @Published var canvasView = PKCanvasView()
    @Published var isShowingView = false
}

extension PKCanvasView {
    func asImage() -> UIImage? {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        
        let image = renderer.image { _ in
            drawHierarchy(in: bounds, afterScreenUpdates: true)
        }
        
        return image
    }
}

