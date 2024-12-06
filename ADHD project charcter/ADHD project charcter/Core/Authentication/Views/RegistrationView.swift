//
//  RegistrationView.swift
//  sample
//
//  Created by student on 03/12/24.
//


//
//  RegistrationView.swift
//  ADHD project charcter
//
//  Created by student on 21/11/24.
//






import SwiftUI

struct RegistrationView: View {
    
    @EnvironmentObject var viewModel:SigninViewModel
    
    @State var email = ""
    @State var password = ""
    @State var username = ""
    @State var fullname = ""
    @Environment(\.dismiss) var dismiss
    @State var isRegistrationPresented = false


    @Binding var appUser: AppUser?

    
    
    var body: some View {
        VStack{
            Spacer()
            
            Image("bird")
                .resizable()
                .scaledToFit()
                .frame(width: 120,height:120)
            
            VStack{
                TextField("Enter your email: ",text: $email)
                    .autocapitalization(.none)
                    .modifier(ADHDTextFieldModifiers())

                
                SecureField("Enter your password: ",text: $password)
                    .modifier(ADHDTextFieldModifiers())

                
//                TextField("Enter your fullname: ",text:$fullname)
//                    .modifier(ADHDTextFieldModifiers())
//
//
//                TextField("Enter your username: ",text:$username)
//                    .modifier(ADHDTextFieldModifiers())
//                    .autocapitalization(.none)

            }
            
            
            
            
            
            
//            Button {
//                action: do {
//                    Task {
//                        do {
//                            let appUser = try await viewModel.registerNewUserWithEmail(email: email, password: password)
//                            self.appUser = appUser
//                            dismiss()
//                        }
//                        catch {
//                            print("issue with registration")
//                        }
//                    }
//                }
//            }
            
            
            
            
            
            
            
            Button() {
                Task {
                    do {
                        let appUser = try await viewModel.registerNewUserWithEmail(email: email, password: password)
                        self.appUser = appUser
                        dismiss()
                    }
                    catch {
                        print("issue with registration")
                    }
                }
            }
            
            
            label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352,height: 44)
                    .background(.black)
                    .cornerRadius(8)
            }
            .padding(.vertical)
            Spacer()
            
            Divider()
            
            Button{
                dismiss()
                
            }label: {
                HStack(spacing: 3){
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical,16)
            
        }
    }
}


struct RegistrationView_Preview: PreviewProvider {
    static var previews: some View {
        RegistrationView(appUser: .constant(.init(uid: "1234", email: nil)))
            .environmentObject(SigninViewModel())
    }
}
