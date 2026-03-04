//
//  ContentView.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/12/26.
//

import SwiftUI

struct ContentView: View {
    
    let books = [
       
        Book(title: "The Return of the King",
             author: "Michelle William",
             cover: "lotr_king"),
    ]
    
    var body: some View {
       
        NavigationStack {
            List(books) { book in
                NavigationLink(destination: DetailView(book: book)) {
                    HStack {
                        Image(book.cover)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        VStack(alignment: .leading){
                            Text(book.title)
                                .font(.headline)
                                .fontWeight(.bold)
                            Text(book.author)
                           }
                        
                        }
                    }
                }
            }
            .navigationTitle("Book Manager")
        }
    }


//#Preview {
 //   ContentView()
//}

