//
//  AuthManager.swift
//  sample
//
//  Created by student on 03/12/24.
//


import Foundation
import Supabase

struct AppUser {
    let uid: String
    let email: String?
}


class AuthManager {
    
    static let shared = AuthManager()
    
    private init() {}
    
    let client = SupabaseClient(supabaseURL: URL(string: "https://tcsueswhyuizikjtxueu.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRjc3Vlc3doeXVpemlranR4dWV1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI4NjgzOTcsImV4cCI6MjA0ODQ0NDM5N30.gnztKVTFM2IvT25m429NdYK-eFCJoRRqg3w9serk64Q")
    
    func getCurrentSession() async throws -> AppUser {
        let session = try await client.auth.session
        return AppUser(uid: session.user.id.uuidString, email: session.user.email)
    }
    
    func registerNewUserWithEmail(email: String, password: String) async throws -> AppUser{
        let regAuthResponse = try await client.auth.signUp(email: email, password: password)
        guard let session = regAuthResponse.session else {
            print("no session with registering user")
            throw NSError()
        }
        return AppUser(uid: session.user.id.uuidString, email: session.user.email)
    }
    
    
    
    func signUpWithEmail(email: String, password: String) async throws -> AppUser{
        let session = try await client.auth.signIn(email: email, password: password)
        return AppUser(uid: session.user.id.uuidString, email: session.user.email)
    }
    
}
