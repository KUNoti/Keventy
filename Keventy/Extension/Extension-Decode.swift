//
//  Extension-Decode.swift
//  Keventy
//
//  Created by Kul Boonanake on 13/3/24.
//

import Foundation

extension KeyedDecodingContainer {
    func decodeDate(forKey key: K) throws -> Date {
        let dateString = try decode(String.self, forKey: key)

        // Custom date formatter to handle the given date format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0) // Ensure UTC time zone
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // Ensure consistent parsing

        guard let date = dateFormatter.date(from: dateString) else {
            throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "Date string does not match format expected by formatter.")
        }

        return date
    }
}
