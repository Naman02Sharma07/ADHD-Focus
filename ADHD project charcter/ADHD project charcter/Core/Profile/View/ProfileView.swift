//
//  ProfileView.swift
//  ADHD project charcter
//
//  Created by student on 22/11/24.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.dismiss) var dismiss // To dismiss the current view
    @State private var appUser: AppUser? // Assume this is passed or set somehow
    var body: some View {
        NavigationView {
            VStack {
                // Profile Image
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 100, height: 100)
                    .overlay(
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .padding(20)
                    )
                    .padding(.top, 20)
                    .foregroundColor(.gray)

                // Details List
                Form {
                    Section {
                        HStack {
                            Text(" Email")
                            Spacer()
                            Text("Danny")
                                .foregroundColor(.gray)
                        }

                        HStack {
                            Text("password")
                            Spacer()
                            Text("******")
                                .foregroundColor(.gray)
                        }

                        HStack {
                            Text("Date of Birth")
                            Spacer()
                            Text("Apr 22, 1984")
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Text("Gender")
                            Spacer()
                            Text("M")
                                .foregroundColor(.gray)
                        }
                    }
                    Button(action: logOut) {
                        Text("Log Out")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 352, height: 44)
                            .background(.black)
                            .cornerRadius(8)
                    }
                }
                
                .frame(maxHeight: 570)
                
                Spacer()
            }
            
            .background(Color.gray.opacity(0.03).edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Profile", displayMode: .inline)
        }
    }
    private func logOut() {
            Task {
                do {
                    try await AuthManager.shared.client.auth.signOut()
                    appUser = nil
                    dismiss()
                } catch {
                    print("Error logging out: \(error.localizedDescription)")
                }
            }
        }
}

#Preview {
    ProfileView()
}
