//
//  SystemIconButton.swift
//  Keventy
//
//  Created by Kul Boonanake on 1/3/24.
//

import SwiftUI

struct SystemIconButton: View {
    
    let systemIconName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: { self.action() }) {
            Image(systemName: systemIconName)
                .font(.title)
                .padding()
                .frame(width: 50, height: 50)
        }
    }
}
