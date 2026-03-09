//
//  SquareCardView.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/24/26.
//

import SwiftUI

struct SquareCardView: View {
    var book: PersistentBook
    var body: some View {
        VStack{
            Text(book.title)
            .frame(maxWidth: .infinity)
            .font(.headline)
            .foregroundColor(.white)
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .padding()
            .background(LinearGradient(
                colors:[.clear, .black.opacity(0.8)],
                startPoint: .bottom,
                endPoint: .top
            ))
            Spacer()
            Text(book.author)
                .frame(maxWidth: .infinity)
                .font(.subheadline)
                .foregroundColor(.white)
                .lineLimit(1)
                .multilineTextAlignment(.center)
                .padding()
                .background(LinearGradient(
                    colors:[.clear, .black.opacity(0.8)],
                    startPoint: .top,
                    endPoint: .bottom
                ))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image(uiImage:book.cover)
                    .resizable()
                    .scaledToFill()
            )
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(12)
        }
      
        
    }
}

