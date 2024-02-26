//
//  Contants.swift
//  Keventy
//
//  Created by Kul Boonanake on 23/2/24.
//

import SwiftUI

enum Constants {
    enum API {
        static let baseUrl = "https://jsonplaceholder.typicode.com/"
        static let users = "todos/"
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
