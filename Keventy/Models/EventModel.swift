//
//  EventModel.swift
//  Keventy
//
//  Created by Kul Boonanake on 27/2/24.
//

import SwiftUI
import Observation


@Observable
class EventModel {
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
            return event.startDateTime <= selectedDate && event.endDateTime >= selectedDate
        }
    }
    
    func render() {
        withObservationTracking {
            print("test")
        } onChange: {
            print("Change")
        }
    }
}

