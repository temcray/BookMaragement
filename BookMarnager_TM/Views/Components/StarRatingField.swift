//
//  StarRatingField.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 3/2/26.
//

import SwiftUI

struct StarRatingField: View {
    
    @Binding var rating: Int
    
    var body: some View {
        
        HStack{
            ForEach(1...5, id: \.self){ rating in
                Button(action:{
                    var _ = print("Changing rating to: \(rating)")
                    self.rating = rating
                }) {
                    Image(systemName: rating <= self.rating ? "star.fill" : "star")
                        .font(.title)
                        .foregroundColor(.yellow)
                }.buttonStyle(.plain)
                
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityValue("\(rating) out of 5")
        .accessibilityLabel("Rating:")
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                rating = min(rating + 1, 5)
            case .decrement:
                rating = max(rating - 1, 0)
            @unknown default:
                break
            }
            
        }
    }
    
}

