//
//  TimeSelectionView.swift
//  Keventy
//
//  Created by Kul Boonanake on 23/2/24.
//

import SwiftUI

struct TimeSelectionViewModel {
    var startDate: Date
}

struct TimeSelectionView: View {
    
    @State private var viewModel: TimeSelectionViewModel
    
    init() {
        _viewModel = State(
            initialValue: TimeSelectionViewModel(
                startDate: .now
        ))
    }
    
    let timeInterval: CGFloat = 60 // Interval in minutes
    let screenWidth = UIScreen.main.bounds.width
        
    var body: some View {
        VStack {
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 20) {
//                    ForEach(0..<13) { index in // 24 hours in a day
//                        Text(timeString(for: index) + " ")
//                            .font(.headline)
//                            .padding(10)
//                            .background(Color.blue.opacity(0.5))
//                            .clipShape(RoundedRectangle(cornerRadius: 10))
//                    }
//                }
//                .padding()
//            }
            Section {
                DatePicker("Date", selection: $viewModel.startDate,
                                displayedComponents: [.date, .hourAndMinute])
            }
        }
    }
    
    func timeString(for index: Int) -> String {
        return String(format: "%d:00", index)
    }
}


#Preview {
    TimeSelectionView()
        .frame(height: 100)
}
