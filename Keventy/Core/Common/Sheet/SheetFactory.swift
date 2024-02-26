////
////  SheetFactory.swift
////  Keventy
////
////  Created by Kul Boonanake on 25/2/24.
////

import SwiftUI

enum SheetType: String {
    case create, edit
    
    var text: String {
        switch self {
        case .create:
            return "Create"
        case .edit:
            return "edit"
        }
    }
}

protocol Sheet {
    associatedtype ToolbarContent: View
    var sheetType: SheetType { get }
    var title: String { get }
    var onSubmit: () -> Void { get }
    var onClose: () -> Void { get }
    var toolbarView: ToolbarContent { get }
}

extension Sheet {
    var toolbarView: some View {
        HStack {
            Button(action: onClose) {
                Image(systemName: "xmark")
                    .foregroundColor(.red)
            }
            Spacer()
            Button(action: onSubmit) {
                Text(title)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(.purple)
                    .foregroundColor(.white) 
                    .cornerRadius(8)
            }
        }
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct UpdateEventSheetView: Sheet, View {
    let sheetType: SheetType = .edit
    
    var title: String {
        sheetType.text
    }
    
    let onSubmit: () -> Void
    let onClose: () -> Void
    
    init(
        onClose: @escaping () -> Void,
        onSubmit: @escaping () -> Void
    ) {
        self.onClose = onClose
        self.onSubmit = onSubmit
    }
    
    var body: some View {
        Text("test")
    }
}

class SheetFactory {
    func makeSheet(
        sheetType: SheetType,
        onSubmit: @escaping () -> Void,
        onClose: @escaping () -> Void
    ) -> any View {
        switch sheetType {
        case .create:
            return CreateEventSheetView(onClose: onClose, onSubmit: onSubmit)
        case .edit:
            return UpdateEventSheetView(onClose: onClose, onSubmit: onSubmit)
        }
    }
}
