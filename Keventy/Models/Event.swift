//
//  Event.swift
//  Keventy
//
//  Created by Kul Boonanake on 26/2/24.
//

import SwiftUI
import MapKit

struct Event: Decodable, Identifiable, Equatable {
    let id: Int
    let latitude: Double
    let longitude: Double
    let title: String
    let image: URL
    let creator: String
    let detail: String
    let tag: String
    let locationName: String
    let startDateTime: Date
    let endDateTime: Date
    
    private enum CodingKeys: String, CodingKey {
        case id
        case latitude
        case longitude
        case title
        case image
        case creator
        case detail
        case tag
        case locationName
        case startDateTime
        case endDateTime
    }
    
    init(id: Int, latitude: Double, longitude: Double, title: String, image: URL, creator: String, detail: String, tag: String, locationName: String, startDateTime: Date, endDateTime: Date) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.title = title
        self.image = image
        self.creator = creator
        self.detail = detail
        self.tag = tag
        self.locationName = locationName
        self.startDateTime = startDateTime
        self.endDateTime = endDateTime
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        title = try container.decode(String.self, forKey: .title)
        image = try container.decode(URL.self, forKey: .image)
        creator = try container.decode(String.self, forKey: .creator)
        detail = try container.decode(String.self, forKey: .detail)
        tag = try container.decode(String.self, forKey: .tag)
        locationName = try container.decode(String.self, forKey: .locationName)
        startDateTime = try container.decodeDate(forKey: .startDateTime)
        endDateTime = try container.decodeDate(forKey: .endDateTime)
    }
}

extension Event {
    //MARK: - MKMapItem
    func mapItem() -> MKMapItem {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let placemark = MKPlacemark(coordinate: location, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
}

