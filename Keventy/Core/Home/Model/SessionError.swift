//
//  SessionError.swift
//  Keventy
//
//  Created by Kul Boonanake on 1/3/24.
//

import Foundation


struct SessionError: Identifiable {
    var id: String {
        "\(timestamp)"
    }
    
    let timestamp: Date
    let message: String
    
    init(_ error: Error) {
        let errorWithInfo = error as NSError
        let messages = [
            errorWithInfo.localizedDescription,
            errorWithInfo.localizedFailureReason,
            errorWithInfo.localizedRecoverySuggestion
        ]
        self.message = messages.compactMap({ $0 }).joined(separator: "\n")
        self.timestamp = Date()
    }
}
