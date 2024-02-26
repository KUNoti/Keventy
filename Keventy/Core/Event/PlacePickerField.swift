//
//  PlacePickerField.swift
//  Keventy
//
//  Created by Kul Boonanake on 22/2/24.
//

import SwiftUI

struct Place {
    let name: String
    let fullExtendedAddress: String
}

struct PlacePickerField: View {
//    TODO: @Binding var place: LMPlace?
    @Binding var place: Place?
    @State private var showPicker = false
    @State private var selectPlace: Any?
    
    let viewModel = PlacePickerViewModel(searchText: "", selectPlace: "", place: "")
    
    var body: some View {
        HStack {
            if place == nil {
                Button(action: {
                    self.showPicker.toggle()
                }, label: {
                    Text("Select Location").foregroundColor(.white)
                })
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(.purple)
                .foregroundColor(.white)
                .cornerRadius(8)
                .sheet(isPresented: self.$showPicker, content: {
                    PlacePickerView(viewModel: viewModel, showModel: $showPicker, selectPlace: $selectPlace)
                })
            }
            else {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(place?.name ?? "Name").padding(.top, -1)
                            Spacer()
                        }
                        Text(place?.fullExtendedAddress ?? "fullExtendedAddress").foregroundColor(.secondary).font(.footnote)
                    }
                    Spacer()
                    Button {
                        print("Clear the location")
                        place = nil
                    } label: {
                        Image(systemName: "xmark.circle.fill").frame(width: 20, height: 20, alignment: .center).foregroundColor(Color(.systemGray2))
                    }
                    .buttonStyle(PlainButtonStyle())
                }.padding(.vertical, -2)
            }
        }
    }
}

#Preview {
//    PlacePickerField(place: .constant(Place(name: "Sample Place", fullExtendedAddress: "Sample Address")))
    PlacePickerField(place: .constant(nil))
}
