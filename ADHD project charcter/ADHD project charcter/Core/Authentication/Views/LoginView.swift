//
//  LoginView.swift
//  sample
//
//  Created by student on 03/12/24.
//


import SwiftUI
import Supabase

struct LoginView: View {
    
    @StateObject var viewModel = SigninViewModel()
    @State private var isLoggedIn = false  // Track login state

    @State var email = ""
    @State var password = ""
    @Environment(\.dismiss) var dismiss
    @Binding var appUser: AppUser?
    @State var isRegistrationPresented = false

    
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Login")
                    .font(.system(size: 40, weight: .bold, design: .default))
                    .padding(.top,50)
                    
                Spacer()

                Image("bird")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120,height:120)
                
                VStack{
                    TextField("Enter your email: ",text:$email)
                        .autocapitalization(.none)
                        .modifier(ADHDTextFieldModifiers())
                    
                    SecureField("Enter your password: ",text:$password)
                        .modifier(ADHDTextFieldModifiers())
                }
                
                
                NavigationLink{
                    Text("Forget password")
                }label: {
                    Text("Forget Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing,28)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity,alignment:.trailing)
                }
                
                
                Button{
                    Task {
                        do {
                            let appUser = try await viewModel.loginInWithEmail(email: email, password: password)
                            isLoggedIn = true  // Set login state to true
                            self.appUser = appUser
                            UserDefaults.standard.set(email, forKey: "loggedInEmail")
                            dismiss()
                        }
                        catch {
                            print("issue with sign in")
                        }
                    }
                }
            label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352,height: 44)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                Spacer()
                
                Divider()
                
                Button("New User? Register Here"){
                    isRegistrationPresented.toggle()
                    
                }
                .foregroundColor(Color(uiColor: .label))
                .sheet(isPresented: $isRegistrationPresented){
                    RegistrationView(appUser: $appUser)
                        .environmentObject(viewModel)
                }
                .padding(.vertical,16)
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                ADHDTabView()  // Navigate to MainView after successful login
                        }
        }
    }
}


//struct LoginView_Preview: PreviewProvider{
//    static var previews: some View {
//        LoginView(appUser: .constant(.init(uid: "1234", email: nil))).environmentObject(SigninViewModel())
//    }
//}


struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView(appUser: .constant(.init(uid: "1234", email: "user@example.com"))) // Initialize with a sample email
            .environmentObject(SigninViewModel())
            .onAppear {
                // Simulate the user being logged in by storing the email in UserDefaults
                UserDefaults.standard.set("user@example.com", forKey: "loggedInEmail")
                
                // Retrieve the stored email from UserDefaults and print (for debugging)
                if let loggedInEmail = UserDefaults.standard.string(forKey: "loggedInEmail") {
                    print("Preview: Logged in with email: \(loggedInEmail)")
                }
            }
    }
}
