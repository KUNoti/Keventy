//
//  User.swift
//  Keventy
//
//  Created by Kul Boonanake on 23/2/24.
//

import Foundation

struct User: Codable {
    let id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case id, title
    }
}
