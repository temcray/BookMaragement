//
//  SummaryView.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/19/26.
//

import SwiftUI

struct SummaryView: View {
    
    var book: Book
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text(book.title)
                .font(.title)
                .fontWeight(.bold)
            
            Text(book.summary)
                .font(.body)
                
            Spacer()
        }
        .padding()
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
   // SummaryView()
//}
