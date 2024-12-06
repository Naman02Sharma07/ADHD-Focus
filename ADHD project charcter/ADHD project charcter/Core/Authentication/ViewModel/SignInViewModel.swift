
//  SignInViewModel.swift
//  ADHD project charcter
//
//  Created by student on 29/11/24.


import Foundation
import Supabase

@MainActor
class SigninViewModel: ObservableObject {
    
    
    func isFormVaild(email: String, password: String) -> Bool {
        guard email.isValidEmail(), password.count > 8 else {
            return false
        }
        return true
    }
    
    
    func registerNewUserWithEmail(email: String, password: String) async throws -> AppUser {
        if isFormVaild(email: email, password: password) {
            return try await AuthManager.shared.registerNewUserWithEmail(email: email, password: password)
        }else {
            print("details are not valid")
            throw NSError()
        }
    }
    
    func loginInWithEmail(email: String, password: String) async throws -> AppUser {
        if isFormVaild(email: email, password: password) {
            return try await AuthManager.shared.signUpWithEmail(email: email, password: password)
        }else {
            print("details are not valid")
            throw NSError()
        }
    }
    
//
    
    
}

extension String {
        func isValidEmail() -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)

    }
}
