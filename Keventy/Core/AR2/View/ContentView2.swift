//
//  ContentView2.swift
//  Keventy
//
//  Created by Kul Boonanake on 23/2/24.
//

import SwiftUI
import RealityKit

struct ContentView2 : View {
    @EnvironmentObject var viewModel : ViewModel
    var body: some View {
        ZStack{
            ARViewContainer().edgesIgnoringSafeArea(.all)
            button.padding(50)
            
        }.sheet(isPresented: $viewModel.isShowingView,onDismiss: {viewModel.isShowingView = false}){
            DrawView().presentationDetents([.medium])
        }
    }
    var button : some View {
        HStack{
            VStack{
                Spacer()
                Button(action: {viewModel.isShowingView = true}){
                    ZStack {
                        Circle()
                            .foregroundColor(.blue)
                            .frame(width: 50, height: 50)
                        
                        Image(systemName: "scribble")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                }
            }
            Spacer()
        }
    }
}

#if DEBUG
struct ContentView2_Previews : PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
#endif

