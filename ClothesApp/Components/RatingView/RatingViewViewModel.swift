//
//  RatingViewViewModel.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 12.02.23.
//

import SwiftUI

extension RatingView {
    final class viewModel: ObservableObject {
        
        var offImage: Image?
        var onImage = Image(systemName: "star.fill")
        
        var label = ""
        
        var maximumRating = 5
        
        var offColor = Color.gray
        var onColor = Color.yellow
    }
}
