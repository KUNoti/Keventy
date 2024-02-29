//
//  EventCardView.swift
//  Keventy
//
//  Created by Kul Boonanake on 23/2/24.
//

import SwiftUI
import Kingfisher


struct Tag: Codable {
    // Define properties for Tag if necessary
    let name: String
    let color: String
}

struct EventCardView: View {
    var event: Event
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.largeTitle.bold())
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text(event.locationName)
                        .font(.subheadline)
                }
                Text(event.detail)
                    .font(.caption)
            }
            .foregroundColor(.white)
            
            HStack {
                Label(event.tag, systemImage: "music.quarternote.3")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .font(.caption)
                    .background(.white)
                    .cornerRadius(8)
                    .foregroundColor(.gray)
            }
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: UIScreen.main.bounds.width - 20, height: 128)
        .padding()
        .background(backgroundImage)
        .cornerRadius(16)
        .shadow(color: .gray, radius: 8, x: 4, y: 4)
    }
}

extension EventCardView {
    
    private var backgroundImage: some View {
        ZStack {
            KFImage(event.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            LinearGradient(
                gradient: Gradient(colors: [Color(white: 0, opacity: 0.75), .clear]),
                startPoint: .topLeading,
                endPoint: UnitPoint(x: 0.4, y: 1.0)
            )
        }
    }
    
    private func metricsLabel(value: Float, systemImage: String) -> some View {
        Label(value.formatted(), systemImage: systemImage)
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .font(.caption)
            .background(.white)
            .cornerRadius(8)
            .foregroundColor(.gray)
    }
}

//#Preview {
    
//    return EventCardView(event: .init(id: 1,
//                                      latitude: 13.8517,
//                                      longitude: 100.5678,
//                                      title: "Music Concert",
//                                      image: URL(string: "https://mpics.mgronline.com/pics/Images/560000007342901.JPEG")!,
//                                      creator: "InnovateTech",
//                                      detail: "Explore the latest in technology",
//                                      tag: "Music",
//                                      locationName: "Concert Hall",
//                                      startDateTime: .now,
//                                      endDateTime: .now))
//}
