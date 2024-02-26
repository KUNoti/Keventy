//
//  ExplorePage.swift
//  Keventy
//
//  Created by Kul Boonanake on 23/2/24.
//

import SwiftUI

struct ExplorePage: View {
    private let eventworker = EventWorker()
    
    var body: some View {
        VStack {
            TimeSelectionView()
            Spacer()
            MapExploreView()
        }
        .onAppear {
            Task {
                await eventworker.start()
            }
        }
    }
}

#Preview {
    ExplorePage()
}
