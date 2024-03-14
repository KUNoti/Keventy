//
//  LocationDetailsView.swift
//  Keventy
//
//  Created by Kul Boonanake on 13/3/24.
//

import SwiftUI
import MapKit
import Kingfisher

struct LocationDetailsView: View {
    @Binding var selectevent: Event?
    @Binding var show: Bool
    @State private var lookAroundScene: MKLookAroundScene?
    @Binding var getDirections: Bool
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(selectevent?.mapItem().placemark.name ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(selectevent?.mapItem().placemark.title ?? "")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .lineLimit(2)
                        .padding(.trailing)
                }
                
                Spacer()
                
                Button {
                    show.toggle()
                    selectevent = nil
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.gray, Color(.systemGray6))
                }
            }
            
            
            if let image = selectevent?.image {
                KFImage(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .cornerRadius(12)
                    .padding()
            } else {
                ContentUnavailableView("No preview available", systemImage: "eye.slash")
            }
            
            
            HStack(spacing: 24) {
                Button {
                    if let selectevent {
                        selectevent.mapItem().openInMaps()
                    }
                } label: {
                    Text("Open in Maps")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 170, height: 48)
                        .background(.green)
                        .cornerRadius(12)
                }
                
                Button {
                    getDirections = true
                    show = false
                } label: {
                    Text("Get Directions")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 170, height: 48)
                        .background(.blue)
                        .cornerRadius(12)
                }
            }
        }
        .padding()
    }
}
#Preview {
    LocationDetailsView(selectevent: .constant(nil), show: .constant(false), getDirections: .constant(false))
}
