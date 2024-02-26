//
//  ARManager.swift
//  Keventy
//
//  Created by Kul Boonanake on 22/2/24.
//

import Combine

class ARManager {
    static let shared = ARManager()
    private init() {}
    
    var actionStream = PassthroughSubject<ARAction, Never>()
}
