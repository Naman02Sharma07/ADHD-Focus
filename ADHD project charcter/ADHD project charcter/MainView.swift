//
//  MainView.swift
//  ADHD project charcter
//
//  Created by student on 04/12/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Text("Welcome to the Main View!")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                // Handle log out action here
            }) {
                Text("Log Out")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 44)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct MainView_Preview: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
