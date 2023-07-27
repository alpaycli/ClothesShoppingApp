//
//  ProductsView.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 14.02.23.
//

import SwiftUI

struct ProductsView: View {
    @StateObject var favorites = Favorites()
    @EnvironmentObject var order: Order
    
    @StateObject var vm = ViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: vm.columns) {
                    ForEach(vm.filteredProducts) { item in
                        NavigationLink {
                            ProductDetailView(product: item)
                        } label : {
                            VStack {
                                AsyncImage(url: URL(string: item.thumbnail),scale: 3) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 150)
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("$ \(item.price)")
                                            .foregroundColor(.black)
                                            .fontWeight(.bold)
                                        
                                        Spacer()
                                        
//                                        if favorites.contains(item) {
//                                            Image(systemName: "heart.fill")
//                                                .foregroundColor(.black)
//                                        }
                                    }
                                    
                                    Text(item.title)
                                        .lineLimit(2)
                                        .foregroundColor(.secondary)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .task {
                await vm.fetchData()
            }
            .navigationTitle("👗 Products")
            .searchable(text: $vm.searchText, prompt: "Search for a clothe")
        }
        .environmentObject(favorites)
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
