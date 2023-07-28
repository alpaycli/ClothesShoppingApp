//
//  FavoritesView.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 06.01.23.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject var favorites = Favorites()
    
    var body: some View {
        NavigationView {
            VStack {
                List(favorites.clothes, id: \.self) { item in
                    Text(item)
                }
            }
            .navigationTitle("Favorites")
        }
        .onAppear(perform: favorites.loadData)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            
    }
}
