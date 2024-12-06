//
//  ProfileView.swift
//  ADHD project charcter
//
//  Created by student on 22/11/24.
//

import SwiftUI

struct ProfileView: View {
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
                            Text("First Name")
                            Spacer()
                            Text("Danny")
                                .foregroundColor(.gray)
                        }

                        HStack {
                            Text("Last Name")
                            Spacer()
                            Text("Rico")
                                .foregroundColor(.gray)
                        }

                        HStack {
                            Text("Date of Birth")
                            Spacer()
                            Text("Apr 22, 1984")
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Text("Password")
                            Spacer()
                            Text("*******")
                                .foregroundColor(.gray)
                        }
                    }
                    Button{
    //
                        
                    }label: {
                        Text("Log Out")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 352,height: 44)
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
}

#Preview {
    ProfileView()
}
