//
//  DetailView.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/19/26.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var book: Book
    
    var body: some View {
        ScrollView {
            
            VStack(spacing: 10) {
                
                Text(book.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Image(book.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack {
                        Text("Author:")
                            .fontWeight(.semibold)
                        Text(book.author)
                    }
                    
                    HStack {
                        Text("Year:")
                            .fontWeight(.semibold)
                        Text("\(book.year)")
                    }
                    
                    HStack {
                        Text("Summary:")
                            .fontWeight(.semibold)
                        Text(book.summary)
                    }
                    
                    HStack{
                        ForEach(1...5, id: \.self) {
                            number in
                            Image(systemName: number <= book.rating ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    book.rating = number
                                }
                        }
                    }
                    
                    HStack {
                        Spacer()
                        Toggle(isOn: $book.isFavorite){
                            Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                                .foregroundStyle(book.isFavorite ? .red : .secondary)
                                .font(.title)
                        }
                        .toggleStyle(.button)
                        .buttonStyle(.plain)
                        .animation(.spring, value: book.isFavorite)
                        
                    }
                }
                .padding()
                    
                NavigationLink("Read Summary") {
                    SummaryView(book: book)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

//#Preview {
    //DetailView()
//}

