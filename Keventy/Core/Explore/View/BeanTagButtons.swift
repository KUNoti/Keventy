//
//  BeanTagButtons.swift
//  Keventy
//
//  Created by Kul Boonanake on 28/2/24.
//

import SwiftUI

struct BeanTagButtons: View {
    var events: [Event]?
    @Binding var searchResults: [Event]?
    @Binding var selectedEvent: Event?
    @State private var selectedTag: String?
    
    private var tagButtons: [String] {
        return ["Music", "Sport", "KU", "Art", "Festival"]
    }
    
    private func iconForTag(_ tag: String) -> String {
        switch tag {
        case "Music": return "music.quarternote.3"
        case "Sport": return "sportscourt"
        case "KU": return "graduationcap"
        case "Art": return "theatermask.and.paintbrush"
        case "Festival": return "party.popper"
        default: return ""
        }
    }
    
    private func filterResults() {
            guard let selectedTag = selectedTag else { return }
        let filteredResults = events?.filter { $0.tag == selectedTag }
            searchResults = filteredResults
            selectedEvent = nil
        }
    
    var body: some View {
        HStack {
            ForEach(tagButtons, id: \.self) { tag in
                Button {
                    selectedTag = tag
                    filterResults()
                } label: {
                    Label(tag, systemImage: iconForTag(tag))
                }
                .buttonStyle(.bordered)
                .foregroundColor(selectedTag == tag ? .blue : .black) // Change style when selected
                .padding()
            }
        }
        .frame(width: UIScreen.main.bounds.width - 20, height: 50)
        .labelStyle(.iconOnly)
    }
}

//#Preview {
//    BeanTagButtons(searchResults: .constant(nil))
//}
