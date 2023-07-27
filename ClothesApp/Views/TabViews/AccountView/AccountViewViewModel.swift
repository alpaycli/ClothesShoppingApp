//
//  AccountViewViewModel.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 27.07.23.
//

import FirebaseAuth
import Foundation

final class AccountViewViewModel: ObservableObject {
    
    func signOut() throws {
        try AuthManager.shared.signOut()
    }
}
