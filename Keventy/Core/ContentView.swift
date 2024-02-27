//
//  ContantView.swift
//  Keventy
//
//  Created by Kul Boonanake on 24/2/24.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab:BottomBarSelectedTab = .home
    @State var isPresentingBottomSheet = false
    
    let viewModel = ViewModel()
    
    var body: some View {
        VStack{
            if selectedTab == .home{
                ContentView2()
            }
            
            if selectedTab == .search{
                ExplorePage()
            }
            
            //            if selectedTab == .plus{
            //                Text("Add")
            //            }
            if selectedTab == .notification{
                Text("Notification")
            }
            if selectedTab == .profile{
                Text("Profile")
            }
            Spacer()
            BottomBar(
                selectedTab: $selectedTab,
                isPresentingBottomSheet: $isPresentingBottomSheet
            )
        }
        .sheet(isPresented: $isPresentingBottomSheet, content: {
            CreateEventSheetView(onClose: onClose, onSubmit: {})
        })
        .environmentObject(viewModel)
    }
}

private extension ContentView {
    func onClose() {
        isPresentingBottomSheet.toggle()
    }
}

#Preview {
    ContentView()
}
