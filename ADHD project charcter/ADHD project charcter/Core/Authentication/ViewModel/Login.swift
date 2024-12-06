//
//  Login.swift
//  ADHD project charcter
//
//  Created by student on 21/11/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""

    
    
//    @MainActor
//    func login() async throws {
//        try await AuthService.shared.login(withEmail: email, password: password)
//    }
}
