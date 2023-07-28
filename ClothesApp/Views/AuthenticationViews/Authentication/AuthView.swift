//
//  AuthView.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 27.07.23.
//

import GoogleSignIn
import GoogleSignInSwift
import SwiftUI

@MainActor
final class AuthViewModel: ObservableObject {
    func signInWithGoogle() async throws {
        let helper = SignInWithGoogleHelper()
        let tokens = try await helper.signIn()
        try await AuthManager.shared.signInGoogle(tokens: tokens)
    }
}

struct AuthView: View {
    @StateObject private var authViewModel = AuthViewModel()
    
    @Binding var showSignInView: Bool
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                NavigationLink {
                    SignUpEmailView(showSignInView: $showSignInView)
                } label: {
                    Text("Sign-up with Email")
                        .foregroundColor(.primary)
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                }
                NavigationLink {
                    
                } label: {
                    Text("Already have an account ? Sign in with email")
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 30)
                
                GoogleSignInButton(scheme: .dark, style: .wide, state: .normal) {
                    Task {
                        do {
                            try await authViewModel.signInWithGoogle()
                            showSignInView = false
                        } catch {
                            throw AuthError.unknown
                        }
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Authentication")
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(showSignInView: .constant(false))
    }
}
