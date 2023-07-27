//
//  RatingView.swift
//  Bookworm
//
//  Created by Alpay Calalli on 21.08.22.
//

import SwiftUI

struct RatingView: View {
    @StateObject var vm = viewModel()
    @Binding var rating: Int
    let clothe: Clothe
    
    var body: some View {
        HStack{
            if vm.label.isEmpty == false{
                Text(vm.label)
            }
            
            ForEach(1..<vm.maximumRating + 1, id: \.self){ number in
                image(for: number)
                    .foregroundColor(number > rating ? vm.offColor : vm.onColor)
                    .onTapGesture {
                        withAnimation{
                            rating = number
                        }
                    }
            }
            
            Text("(Overall: \(clothe.rating.rate, specifier: "%.1f"))")
                .fontWeight(.semibold)
        }
        .accessibilityElement()
        .accessibilityLabel("Rating")
        .accessibilityValue(rating == 1 ? "1 star" : "\(rating) stars")
        .accessibilityAdjustableAction{ direction in
            switch direction{
            case .increment:
                if rating < vm.maximumRating { rating += 1 }
            case .decrement:
                if rating > 1 { rating -= 1}
            default:
                break
            }
        }
    }
    func image(for number: Int) -> Image {
        if number > rating{
            return vm.offImage ?? vm.onImage
        } else {
            return vm.onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4), clothe: Clothe.example)
    }
}
