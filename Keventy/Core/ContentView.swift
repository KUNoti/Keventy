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
    
    var body: some View {
        NavigationStack{
            VStack{
                if selectedTab == .home{
                    HomeView()
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
        }
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
