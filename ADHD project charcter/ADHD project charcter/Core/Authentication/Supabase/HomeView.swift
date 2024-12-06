//
//  HomeView.swift
//  ADHD project charcter
//
//  Created by student on 29/11/24.
//

import SwiftUI

struct HomeView: View {
    @State var appUser: AppUser
    
    var body: some View {
        VStack {
            Text(appUser.uid)
            
            Text(appUser.email ?? "No Email")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(appUser:.init(uid:"1234",email:"nshhd@gmail.com" ))
    }
}
