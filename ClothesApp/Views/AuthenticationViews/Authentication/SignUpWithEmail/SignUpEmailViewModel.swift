//
//  SignInEmailViewModel.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 27.07.23.
//

import FirebaseAuth
import Foundation

final class SignUpEmailViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signUpWithEmail() async throws {
        
        guard !email.isEmpty, !password.isEmpty else {
            throw AuthError.badEmailOrPassword
        }
        
        try await AuthManager.shared.createUser(email: email, password: password)
    }
    
    func signInWithEmail() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            throw AuthError.badEmailOrPassword
        }
        
        try await AuthManager.shared.signInUser(email: email, password: password)
    }
    
}
