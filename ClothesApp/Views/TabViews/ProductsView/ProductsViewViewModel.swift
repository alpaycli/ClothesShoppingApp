//
//  ProductsViewViewModel.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 14.02.23.
//

import SwiftUI

extension ProductsView {
    @MainActor
    class ViewModel: ObservableObject {
        @Published var products: [Product] = []
        @Published var searchText = ""
          
        let columns = [
            GridItem(.adaptive(minimum: 150))
        ]
        
        var filteredProducts: [Product] {
            if searchText.isEmpty {
                return products
            } else {
                return products.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
            }
        }
        
        func fetchData() async {
            // dont re-fetch if its already fetched
            guard products.isEmpty else {
                return
            }
            
            do {
                let url = URL(string: "https://dummyjson.com/products")!
                
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let decoder = JSONDecoder()
                
                let productResponse = try decoder.decode(ProductResponse.self, from: data)
                products = productResponse.products
                
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
