//
//  PlacePickerView.swift
//  Keventy
//
//  Created by Kul Boonanake on 22/2/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    @State private var isEditing = false
    
    var body: some View {
        TextField("Search ...", text: $searchText)
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                    
                    if isEditing {
                        Button (action: {
                            self.searchText = ""
                        }){
                           Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }

                    }
                }
            ).padding(.horizontal, 10)
            .onTapGesture {
                self.isEditing = true
            }
    }
}

class PlacePickerViewModel: ObservableObject  {
    @Published var searchText: String
    @Published var selectPlace: String
    @Published var place: String
    
    init(searchText: String, selectPlace: String, place: String) {
        self.searchText = searchText
        self.selectPlace = selectPlace
        self.place = place
    }
}

struct PlacePickerView: View {
    @ObservedObject var viewModel: PlacePickerViewModel
    
    @Binding var showModel: Bool
    @Binding var selectPlace: Any?
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $viewModel.searchText).padding(.top, 8)
                
//                PlaceListView(
//                    places: viewModel.places,
//                    showModel: 
//                        self.$showModel,
//                        selectPlace: self.$selectPlace
//                )
            }
        }
        .navigationTitle("Location")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.showModel.toggle()
                }, label: {
                    Image(systemName: "xmark")
                })
            }
        }
    }
}



#Preview {
    SearchBar(searchText: .constant("test"))
}
