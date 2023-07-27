//
//  RootView.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 27.07.23.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var order = Order()
    
    @State private var showSignInView = false
    var body: some View {
        ZStack {
            AppTabView(showSignInView: $showSignInView)
                .environmentObject(order)
        }
        .onAppear {
            let currentUser = try? AuthManager.shared.getAuthenticatedUser()
            self.showSignInView = currentUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView) {
            AuthView(showSignInView: $showSignInView)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
