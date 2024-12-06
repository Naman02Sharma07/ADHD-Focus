//
//  Registration.swift
//  ADHD project charcter
//
//  Created by student on 21/11/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @MainActor
    func createUser() async throws {
        print("DEBUG: create user here  ")
    }
}
    
//    @Published var email = ""
//    @Published var password = ""
//    @Published var username = ""
//    @Published var fullname = ""
//    
    
//    @MainActor
//    func createUser() async throws {
//        try await AuthService.shared.createUser(
//            withEmail: email,
//            password: password,
//            fullname: fullname,
//            username: username
//        )
//    }


    
