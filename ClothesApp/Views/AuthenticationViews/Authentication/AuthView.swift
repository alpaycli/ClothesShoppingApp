//
//  AuthView.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 27.07.23.
//

import SwiftUI

struct AuthView: View {
    @Binding var showSignInView: Bool
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                NavigationLink {
                    SignUpEmailView(showSignInView: $showSignInView)
                } label: {
                    Text("Sign-in with Email")
                        .foregroundColor(.primary)
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
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
