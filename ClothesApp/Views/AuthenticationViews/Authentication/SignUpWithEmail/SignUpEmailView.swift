//
//  SignInEmailView.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 27.07.23.
//

import SwiftUI

struct SignUpEmailView: View {
    @StateObject var viewModel = SignUpEmailViewModel()
    
    @Binding var showSignInView: Bool
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    TextField("Email", text: $viewModel.email)
                    
                    SecureField("Password", text: $viewModel.password)
                }
                .padding()
                .background(.blue.opacity(0.6))
                .cornerRadius(10)
                
                Button("Sign Up") {
                    Task {
                        do {
                            try await viewModel.signUpWithEmail()
                            showSignInView = false
                        } catch {
                            throw AuthError.badEmailOrPassword
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                    
                Spacer()
            }
            .padding()
            .navigationTitle("Sign-up with Email")
        }
    }
}

struct SignUpEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpEmailView(showSignInView: .constant(false))
    }
}
