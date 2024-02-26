//
//  Event.swift
//  Keventy
//
//  Created by Kul Boonanake on 26/2/24.
//

import SwiftUI

struct Test: Sendable, Decodable {
    let test: Int
    
    private enum CodingKeys: String, CodingKey {
        case test
    }
}

struct Event: Sendable, Decodable {
    let id: Int
    let latitude: Double
    let longitude: Double
    let title: String
    let image: URL
    let creator: String
    let detail: String
//    let tag: [String]
    let locationName: String
    let startDateTime: String
    let endDateTime: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case latitude
        case longitude
        case title
        case image
        case creator
        case detail
//        case tag
        case locationName
        case startDateTime
        case endDateTime
    }
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(String.self, forKey: .id)
//        latitude = try container.decode(Double.self, forKey: .latitude)
//        longitude = try container.decode(Double.self, forKey: .longitude)
//        title = try container.decode(String.self, forKey: .title)
//        image = try container.decode(URL.self, forKey: .image)
//        creator = try container.decode(String.self, forKey: .creator)
//        detail = try container.decode(String.self, forKey: .detail)
//        tag = try container.decode([String].self, forKey: .tag)
//        locationName = try container.decode(String.self, forKey: .locationName)
//        startDateTime = try container.decode(Date.self, forKey: .startDateTime)
//        endDateTime = try container.decode(Date.self, forKey: .endDateTime)
//    }
    
//    private func decodeDate(from container: KeyedDecodingContainer<CodingKeys>, forKey key: CodingKeys) throws -> Date {
//        let dateString = try container.decode(String.self, forKey: key)
//        // Specify the date format expected in your JSON
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Example format, adjust as per your JSON
//        if let date = dateFormatter.date(from: dateString) {
//            return date
//        } else {
//            throw DecodingError.dataCorruptedError(forKey: key, in: container, debugDescription: "Date string does not match expected format")
//        }
//    }
}




actor EventWorker {
    var work: Task<Void, Never>?
    var events: Event?
    
    
    deinit {
        //assert(work != nil)
        // even though the task is still retained,
        // once it completes it no longer causes a reference cycle with the actor
        print("deinit actor")
    }
    
    
    func start() {
        work = Task {
            NetworkManager.shared.fetchEvents { result in
                switch result {
                case .success(let events):
                    // Here you can handle the fetched events
                    self.events = events // For example, assigning the first event to the event property
                    print(self.events ?? "")
                case .failure(let error):
                    print("Error fetching events: \(error)")
                }
            }
            // but as the task completes, this reference is released
        }
        // we keep a strong reference to the task
    }
}



