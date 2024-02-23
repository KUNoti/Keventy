//
//  CreateEventView.swift
//  Keventy
//
//  Created by Kul Boonanake on 22/2/24.
//

import SwiftUI

struct CreateEventViewModel {
    var name: String
    var description: String
    var shared: Bool
    var startPlace: String
    var endPlace: String
    var startDate: Date
}

struct CreateEventView: View {
    
    @State private var viewModel: CreateEventViewModel
    
    init() {
        _viewModel = State(
            initialValue: CreateEventViewModel(
                name: "",
                description: "",
                shared: false,
                startPlace: "",
                endPlace: "",
                startDate: .now
            ))
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section( header: Text("Event")) {
                    TextField("Name", text: $viewModel.name)
                    
                    ZStack(
                        alignment: .topLeading,
                        content: {
                            TextEditor(text: $viewModel.description)
                                .padding(.horizontal, -5)
                                .padding(.vertical, -5)
                                .frame(minHeight: 120)
                            Text("Description")
                                .foregroundColor(Color(
                                    .placeholderText))
                                .padding(.top, 3)
                                .opacity(viewModel.description.isEmpty ? 1 : 0)
                    })
                }
                
                Section(header: Text("Privacy"), footer: Text("A publicly shared trip is visible for everyone. A not pubulicly shared trip is only visible by you and the event followers")) {
                    Toggle(isOn: $viewModel.shared, label: {
                        Text("Public sharing")
                    })
                }
                
                Section(header: Text("Start")) {
                    DatePicker("Date", selection: $viewModel.startDate,
                                    displayedComponents: [.date, .hourAndMinute])
                }
                
                Section(header: Text("End")) {
                    DatePicker("Date", selection: $viewModel.startDate,
                                    displayedComponents: [.date, .hourAndMinute])
                }
                
                Section(header: Text("Location")) {
                    // TODO: PlacePickerField(place: $viewModel.place)
                }
                
                Section {
                    Button(action: {
                        
                    }) {
                        HStack {
                            Spacer()
                            Text("Delete")
                                .foregroundColor(.red)
                            Spacer()
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    CreateEventView()
}
