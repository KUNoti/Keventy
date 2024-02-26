//
//  EventCardView.swift
//  Keventy
//
//  Created by Kul Boonanake on 23/2/24.
//

import SwiftUI
import Kingfisher

struct EventC: Codable {
    let id: String
    let latitude: Double
    let longitude: Double
    let price: Double
    let title: String
    let rating: Double
    let image: String
    let creator: String
    let detail: String
    let tag: [Tag]
    let locationName: String
    let needRegis: Bool
    let startDateTime: Date // Consider using Date instead of String
    let endDateTime: Date // Consider using Date instead of String
}

struct Tag: Codable {
    // Define properties for Tag if necessary
    let name: String
    let color: String
}

struct EventCardView: View {
    
    var event: EventC
    
    var body: some View {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading) {
                    Text(event.title)
                        .font(.largeTitle.bold())
                    Text(event.locationName)
                        .font(.subheadline)
                }
                .foregroundColor(.white)
                
                HStack {
                    metricsLabel(value: Float(event.latitude) , systemImage: "heart.fill")
                    metricsLabel(value: Float(event.longitude), systemImage: "airplane")
                }
                .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(backgroundImage)
            .cornerRadius(16)
            .shadow(color: .gray, radius: 8, x: 4, y: 4)
        }
}

extension EventCardView {
    
    private var backgroundImage: some View {
        ZStack {
            KFImage(URL(string: event.image))
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

#Preview {
    EventCardView(
        event: .init(
            id: "1",
            latitude: 100,
            longitude: 100,
            price: 30,
            title: "KU Food Festival",
            rating: 0,
            image: "https://scontent.fbkk13-2.fna.fbcdn.net/v/t1.6435-9/142000152_2716453381999537_4277309584130064089_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=7f8c78&_nc_ohc=bVc21S_H_IsAX8pm_Sk&_nc_ht=scontent.fbkk13-2.fna&oh=00_AfAiwkIVcN4TuVz2GKRbmh3scaY0d-CfJ5nGVObVH8kxXA&oe=65E5A270",
            creator: "testcreator",
            detail: "testdetail",
            tag: [.init(name: "tag", color: "")],
            locationName: "บาร์ ใหม่",
            needRegis: false,
            startDateTime: .now,
            endDateTime: .distantFuture))
}
