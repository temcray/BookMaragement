//
//  ListItemView.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 3/2/26.
//

import SwiftUI

struct ListItemView: View {
    let book: PersistentBook
    
    
    var body: some View {
        HStack {
            Image(uiImage:book.cover)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            VStack(alignment: .leading){
                Text(book.title.capitalized(with: .current))
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(1)
                Text(book.author)
            }
        }
        
    }
}
