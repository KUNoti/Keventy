//
//  MapButtonStyle.swift
//  Keventy
//
//  Created by Kul Boonanake on 1/3/24.
//

import SwiftUI


struct MapButtonStyle: ButtonStyle {
    
    var backgroundColor: Color = .systemBackground
    var foregroundColor: Color = .systemBlue
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(backgroundColor.opacity(0.9))
            .foregroundColor(foregroundColor)
            .clipShape(Circle())
            .compositingGroup()
            .opacity(configuration.isPressed ? 0.75 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

