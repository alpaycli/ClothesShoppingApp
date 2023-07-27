//
//  AuthViewModel.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 27.07.23.
//

import FirebaseAuth
import Foundation

final class AuthManager: ObservableObject {
    static let shared = AuthManager()
        
    private init() { }
    
    func getAuthenticatedUser() throws -> AuthDataModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badURL)
            // will handle this later
        }
        
        return AuthDataModel(user: user)
    }
    
    @discardableResult
    func createUser(email: String, password: String) async throws -> AuthDataModel {
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        
        return AuthDataModel(user: authResult.user)
    }
    
    @discardableResult
    func signInUser(email: String, password: String) async throws -> AuthDataModel {
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        
        return AuthDataModel(user: authResult.user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}

enum AuthError: Error {
    case badEmailOrPassword
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .badEmailOrPassword:
            return "Email or password does not match."
        case .unknown:
            return "Something went wrong"
        }
    }
}
