//
//  HomeView.swift
//  Keventy
//
//  Created by Kul Boonanake on 11/3/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // AR Container 2/3 of total screen size
                // Map Container 1/3 of total screen size
                

                Text("ARContainer")
                    .frame(width: geometry.size.width, height: geometry.size.height * 2/3)
                MapView()
                    .frame(width: geometry.size.width, height: geometry.size.height * 1/3)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    HomeView()
}
