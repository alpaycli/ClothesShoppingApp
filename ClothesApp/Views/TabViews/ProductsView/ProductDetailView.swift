//
//  ClotheDetailView.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 05.01.23.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
//    @State private var rating = 3
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: product.thumbnail),scale: 1) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 350)
                } placeholder: {
                    ProgressView()
                }
                
//                VStack(spacing: 5) {
//                    Button {
//                        favorites.contains(clothe) ? favorites.remove(clothe) : favorites.add(clothe)
//                    } label: {
//                        Image(systemName: favorites.contains(clothe) ? "heart.fill" : "heart")
//                            .foregroundColor(.black)
//                    }
//                    .padding(.top)
//                    .font(.system(size: 20))
//                    .fontWeight(.bold)
//
//                    Text("SAVE")
//                        .fontWeight(.semibold)
//                        .padding(.bottom, 15)
//                }
//                .overlay(Rectangle().frame(width: 360, height: 1, alignment: .bottom).foregroundColor(Color.gray), alignment: .bottom)
                
                
                VStack(alignment: .leading, spacing: 20) {
                    Group {
                        Text("$ \(product.price)")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        
                        Text(product.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.secondary)
                            .padding(.bottom, 10)
                        
                        VStack(alignment: .leading) {
                            Text("Rate it!")
                                .fontWeight(.bold)
                            
//                            RatingView(rating: $rating, clothe: clothe)
//                                .padding(.bottom, 15)
                        }
                    }
                    .padding(.leading, 20)
                }
                .overlay(Rectangle().frame(width: 360, height: 1, alignment: .bottom).foregroundColor(Color.gray), alignment: .bottom)
            }
            
            Button("ADD TO BAG") {
//                order.addCard(item: clothe)
            }
            .frame(width: 360, height: 45)
            .background(Color(hue: 0.347, saturation: 0.785, brightness: 0.342))
            .foregroundColor(.white)
            .fontWeight(.bold)
            .padding(.vertical)
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductDetailView(product: Product.example)
        }
    }
}
