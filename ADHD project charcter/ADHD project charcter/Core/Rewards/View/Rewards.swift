//
//  Rewards.swift
//  ADHD project charcter
//
//  Created by student on 10/12/24.
//

import SwiftUI
import Photos

import SwiftUI

struct Rewards: View {
    // Image names for the gallery
    let imageNames = (1...12).map { "photo\($0)" } // Replace with your actual image names
    
    // State to track selected image, default to the first image
    @State private var selectedImage: String?
    
    // Grid layout configuration
    let gridLayout = [GridItem(.adaptive(minimum: 100), spacing: 10)]
    
    var body: some View {
        
            VStack {
                // Big Preview Area
                if let selectedImage = selectedImage {
                    Image(selectedImage)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .clipped()
                        .cornerRadius(12)
                        .shadow(radius: 4)
                        .padding(.horizontal)
                        .animation(.easeInOut, value: selectedImage)
                }
                
                // Grid of Images
                ScrollView {
                    LazyVGrid(columns: gridLayout, spacing: 10) {
                        ForEach(imageNames, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(8)
                                .shadow(radius: 2)
                                .onTapGesture {
                                    // Update selected image
                                    selectedImage = imageName
                                }
                        }
                    }
                    .padding()
                }
            }
            .onAppear {
                // Set the default selected image to the first image in the list
                selectedImage = imageNames.first
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Rewards")
                        .font(.headline) // Adjust the font size and weight as needed
                }
            }
        }
}

struct Rewards_Previews: PreviewProvider {
    static var previews: some View {
        Rewards()
    }
}
