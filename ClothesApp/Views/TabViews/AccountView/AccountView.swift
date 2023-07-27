//
//  AccountView.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 27.07.23.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var viewModel = AccountViewViewModel()
    
    @Binding var showSignInView: Bool
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Button("Sign out") {
                        Task {
                            do {
                                try viewModel.signOut()
                                showSignInView = true
                            } catch {
                                throw AuthError.unknown
                            }
                        }
                    }
                }
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(showSignInView: .constant(false))
    }
}
