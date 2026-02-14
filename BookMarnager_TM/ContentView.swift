//
//  ContentView.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/12/26.
//

import SwiftUI

struct book: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let cover: String
    var summary: String {
        "\(title) by \(author)"
    }
}

struct ContentView: View {
    
    let books = [
        Book(title: "The Fellowship of the Ring", author: "J.R.R.Tolkien",cover:"lotr_fellowship"),
        
        Book(title: "The Two Towers", author: "John WB Jameon", cover: "lotr_towers"),

        Book(title: "The Return of the King", author: "Michelle William", cover: "lotr_king", summary: "This is the second book in the LOR trilogy."),
    ]
    
    var body: some View {
        NavigationStack {
            List(books) { book in
                NavigationLink(destination: DetailView()) {
                    HStack{
                        Image(book.cover)
                            .resizable()
                            .scaledToFit()
                            .frame(width:60, height: 60)
                        VStack(alignment: .leading){
                            Text(book.title)
                                .font(.headline)
                                .fontWeight(.bold)
                            Text(book.author)
                        }
                    }
                }
               
            }
            .navigationTitle("Book Manager")
            
            
        }
        
        
    }
}

//#Preview {
   // ContentView()
        
//}

