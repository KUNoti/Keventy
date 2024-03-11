//
//  CreateEventSheetView.swift
//  Keventy
//
//  Created by Kul Boonanake on 22/2/24.
//

import SwiftUI

struct CreateEventSheetViewModel {
    var name: String
    var description: String
    var shared: Bool
    var startPlace: String
    var endPlace: String
    var startDate: Date
}

struct CreateEventSheetView: View,Sheet {
    let sheetType: SheetType = .create
    var title: String {
        sheetType.text
    }
    let onClose: () -> Void
    let onSubmit: () -> Void
    
    
    @State private var viewModel: CreateEventSheetViewModel = .init(
        name: "",
        description: "",
        shared: false,
        startPlace: "",
        endPlace: "",
        startDate: .now
    )
    
    init(
        onClose: @escaping () -> Void,
        onSubmit: @escaping () -> Void
    ) {
        self.onClose = onClose
        self.onSubmit = onSubmit
    }
    
    @State var place: Place?
    @StateObject var imageViewModel = ImagePickerModel()
    
    var body: some View {
        NavigationView {
            Form {
                EditableRectangleProfileImage(viewModel: imageViewModel)
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
                
                HStack {
                    Spacer()
                    PlacePickerField(place: $place)
                    Spacer()
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
//            .toolbar {
//                ToolbarItemGroup(placement: .navigationBarLeading) {
//                    toolbarView
//                }
//            }
            .navigationTitle("Event")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        onClose()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(Color(.purple))
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // onClose ...
                    } label: {
                        Text("Create")
                            .foregroundStyle(Color(.purple))
                    }
                }
            }
        }
    }
}

#Preview {
    CreateEventSheetView(onClose: {}, onSubmit: {})
}
