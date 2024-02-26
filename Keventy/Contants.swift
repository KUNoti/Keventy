//
//  Contants.swift
//  Keventy
//
//  Created by Kul Boonanake on 23/2/24.
//

import SwiftUI

enum Constants {
    enum API {
        static let baseUrl = "http://localhost:8000/"
        static let users = "todos/"
        static let events = "test"
    }
}

class SafeAreaManager {
    static let shared = SafeAreaManager()
    var topInset: CGFloat = 59
    var bottomInset: CGFloat = 0
}

extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
