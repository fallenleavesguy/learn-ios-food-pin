//
//  NewRestaurantView.swift
//  FoodPin
//
//  Created by donghs on 2024/3/3.
//

import SwiftUI

struct NewRestaurantView: View {
    enum PhotoSource: Identifiable {
        case photoLibrary
        case camera 
        
        var id: Int {
            hashValue
        }
    }
    @State private var photoSource: PhotoSource?
    @State var restaurantName = ""
    @State private var restaurantImage = UIImage(named: "newphoto")!
    @State private var showPhotoOptions = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image(uiImage: restaurantImage)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 200)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        .padding(.bottom)
                        .onTapGesture {
                            self.showPhotoOptions.toggle()
                        }
                    FormTextField(label: "Name", placeholder: "Fill in the restaurant name", value: .constant(""))
                    FormTextField(label: "TYPE", placeholder: "Fill in the restaurant address", value: .constant(""))
                    FormTextField(label: "ADDRESS", placeholder: "Fill in the restaurant address", value: .constant(""))
                    FormTextField(label: "PHONE", placeholder: "Fill in the restaurant phone", value: .constant(""))
                    FormTextView(label: "DESCRIPTION", value: .constant(""), height: 100)
                }
                .padding()
            }
            .navigationTitle("New Restaurant")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Text("Save")
                        .font(.headline)
                        .foregroundStyle(Color("NavigationBarTitle"))
                }
            }
        }
        .tint(.primary)
        .confirmationDialog("Choose your photo source", isPresented: $showPhotoOptions, titleVisibility: .visible) {
            Button("Camera") {
                self.photoSource = .camera
            }
            
            Button("Photo Library") {
                self.photoSource = .photoLibrary
            }
        }
        .fullScreenCover(item: $photoSource) { source in
            switch source {
            case .photoLibrary:
                ImagePicker(sourceType: .photoLibrary, selectedImage: $restaurantImage)
                    .ignoresSafeArea()
            case .camera:
                ImagePicker(sourceType: .camera, selectedImage: $restaurantImage)
                    .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    NewRestaurantView()
}
