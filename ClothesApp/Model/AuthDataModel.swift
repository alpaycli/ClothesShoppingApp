//
//  User.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 27.07.23.
//

import FirebaseAuth
import Foundation

struct AuthDataModel {
    let id: String
    let email: String?
    let photoURL: URL?
    
    init(user: User) {
        self.id = user.uid
        self.email = user.email
        self.photoURL = user.photoURL
    }
    
    init(id: String, email: String?, photoURL: URL?) {
        self.id = id
        self.email = email
        self.photoURL = photoURL
    }
    
    static let exampleUser = AuthDataModel(id: "", email: "alpaycalalli@gmail.com", photoURL: URL(string: ""))
}
