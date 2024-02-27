//
//  TimeSelectionView.swift
//  Keventy
//
//  Created by Kul Boonanake on 23/2/24.
//

import SwiftUI


struct TimeSelectionView: View {
    
    @Binding var selectedDate: Date
    
        
    var body: some View {
        VStack {
            Section {
                DatePicker("Date", selection: $selectedDate,
                                displayedComponents: [.date, .hourAndMinute])
            }
//            Text("Selected Date: \(selectedDate)")
        }
    }
}


#Preview {
    TimeSelectionView(selectedDate: .constant(Date()))
        .frame(height: 100)
}
