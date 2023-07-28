//
//  ContentView.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 20.12.22.
//

import SwiftUI

struct ClothesView: View {
    @ObservedObject var favorites: Favorites
    @EnvironmentObject var order: Order
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: vm.columns) {
                    ForEach(vm.filteredClothes) { item in
                        NavigationLink {
                            ClotheDetailView(clothe: item, favorites: favorites)
                                .environmentObject(order)
                        } label: {
                            VStack {
                                AsyncImage(url: URL(string: item.image),scale: 3) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("$ \(item.price, specifier: "%.2f")")
                                            .foregroundColor(.black)
                                            .fontWeight(.bold)
                                        
                                        Spacer()
                                        
                                        if favorites.contains(item) {
                                            Image(systemName: "heart.fill")
                                                .foregroundColor(.black)
                                        }
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
            .navigationTitle("👗 Clothes")
            .searchable(text: $vm.searchText, prompt: "Search for a clothe")
        }
        .environmentObject(favorites)
    }
}

struct ClothesView_Previews: PreviewProvider {
    static var previews: some View {
        ClothesView(favorites: Favorites())
            .environmentObject(Order())
    }
}

// things to improve
// 1. make it searchable - done
// 2. favorites section - half done
// 3. show customer's bag - done
// 4. rating view - half done
