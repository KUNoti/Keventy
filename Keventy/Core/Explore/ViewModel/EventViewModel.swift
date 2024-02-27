//
//  EventViewModel.swift
//  Keventy
//
//  Created by Kul Boonanake on 27/2/24.
//

import SwiftUI
import Observation


@Observable
class EventViewModel {
    var events: [Event]?
    
    init() {
        loadEvents()
    }
    
    private func loadEvents() {
        NetworkManager.shared.fetchEvents { [weak self] result in
            switch result {
            case .success(let response):
                self?.events = response
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func filteredEvents(selectedDate: Date){
        self.events =  events?.filter { event in
            print(event.startDateTime <= selectedDate && event.endDateTime >= selectedDate)
            print(event.startDateTime)
            return event.startDateTime <= selectedDate && event.endDateTime >= selectedDate
        }
    }
}

