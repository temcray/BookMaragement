//
//  StarRatingView.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 3/2/26.
//

import SwiftUI

struct StarRatingView: View {
    
    var rating: Int
    
    var body: some View {
        HStack{
            ForEach(1...5, id: \.self){ index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .font(.title)
                    .foregroundColor(.yellow)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Rating: \(rating) out of 5")
    }
}

