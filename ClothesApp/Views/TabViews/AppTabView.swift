//
//  AppTabView.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 06.01.23.
//

import SwiftUI

struct AppTabView: View {
    @Binding var showSignInView: Bool
    
    @StateObject var favorites = Favorites()
    var body: some View {
        TabView {
            ClothesView(favorites: favorites)
                .tabItem {
                    Label("Clothes", systemImage: "tshirt")
                }
            
            ProductsView(favorites: favorites)
                .tabItem {
                    Label("Products", systemImage: "product")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            
            BagView()
                .tabItem {
                    Label("Bag", systemImage: "bag")
                }
            
            AccountView(showSignInView: $showSignInView)
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView(showSignInView: .constant(false))
            .environmentObject(Order())
    }
}
