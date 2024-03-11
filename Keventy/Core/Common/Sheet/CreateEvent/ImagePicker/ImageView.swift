//
//  ImageView.swift
//  Keventy
//
//  Created by Kul Boonanake on 11/3/24.
//

import Foundation
import SwiftUI
import PhotosUI

struct ImageView: View {
    let imageState: ImagePickerModel.ImageState
    
    var body: some View {
        switch imageState {
        case .success(let image):
            image
                .resizable()
        case .loading:
            ProgressView()
        case .empty:
            Image(systemName: "photo.artframe")
                .font(.system(size: 40))
                .foregroundColor(.white)
                .blur(radius: 5) // Apply blur effect if no image is available
        case .failure:
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
        }
    }
}

struct RectangleProfileImage: View {
    let imageState: ImagePickerModel.ImageState
    
    var body: some View {
        ImageView(imageState: imageState)
            .scaledToFill()
            .frame(width: 300, height: 100) // Change the frame to a rectangular shape
            .background {
                RoundedRectangle(cornerRadius: 10) // Use RoundedRectangle instead of Circle
                    .fill(
                        LinearGradient(
                            colors: [.gray, .black],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
            }
    }
}

struct EditableRectangleProfileImage: View {
    @ObservedObject var viewModel: ImagePickerModel
    
    var body: some View {
        RectangleProfileImage(imageState: viewModel.imageState)
            .overlay(alignment: .bottomTrailing) {
                PhotosPicker(selection: $viewModel.imageSelection,
                             matching: .images,
                             photoLibrary: .shared()) {
                    Image(systemName: "pencil.circle.fill")
                        .symbolRenderingMode(.multicolor)
                        .font(.system(size: 30))
                        .foregroundColor(.accentColor)
                }
                .buttonStyle(.borderless)
            }
    }
}
