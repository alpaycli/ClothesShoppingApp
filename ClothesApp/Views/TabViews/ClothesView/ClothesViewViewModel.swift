//
//  ProductsView-ViewModel.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 03.02.23.
//

import SwiftUI

extension ClothesView {
    @MainActor
    class ViewModel: ObservableObject {
        @Published var clothes = [Clothe]()
        @Published var searchText = ""
        
        let columns = [
            GridItem(.adaptive(minimum: 150))
        ]
        
        var filteredClothes: [Clothe] {
            if searchText.isEmpty {
                return clothes
            } else {
                return clothes.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
            }
        }
        
        func fetchData() async {
            // dont re-fetch if its already fetched
            guard clothes.isEmpty else {
                return
            }
            
            do {
                let url = URL(string: "https://fakestoreapi.com/products")!
                
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let decoder = JSONDecoder()
                
                clothes = try decoder.decode([Clothe].self, from: data)
                
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
