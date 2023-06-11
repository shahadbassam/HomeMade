//
//  SelectImageView.swift
//  HomeMade
//
//  Created by Tolba Hamdi on 6/11/23.
//

import SwiftUI
import UIKit

struct SelectImageView: View {
    @Binding var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    
    var body: some View {
        VStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .overlay(alignment: .topTrailing) {
                        Button(action: {
                            selectedImage = nil
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.red)
                        }
                        
                    }
                    .padding()
                
            } else {
                Rectangle()
                    .stroke(Color.orange, lineWidth: 2)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .overlay(
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.orange)
                            .frame(width: 34, height: 38)
                    )
                    .onTapGesture {
                        isShowingImagePicker = true
                    }
            }
        }
        .sheet(isPresented: $isShowingImagePicker) {
            ImagePickerView(selectedImage: $selectedImage)
        }
    }
}

struct SelectImageView_Previews: PreviewProvider {
    static var previews: some View {
        SelectImageView(selectedImage: .constant(nil))
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) private var presentationMode
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePickerView
        
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.selectedImage = selectedImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        // No need to update the view controller
    }
}
