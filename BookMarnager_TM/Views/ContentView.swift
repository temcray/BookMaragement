//
//  ContentView.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/19/26.
//

import SwiftUI

struct ContentView: View {
    @State private var newBook = Book(title: "", author: "", year: "", cover: "", summary: "", rating: 0, review: "")
    @State private var showAddView = false
    @State private var books = [
        Book(
            title: "The Fellowship of the Ring",
            author: "J.R.R Tolkien",
            year: "1954",
            cover: "lotr_fellowship",
            summary: "In The Fellowship of the Ring, Frodo Baggins inherits the One Ring from Bilbo, discovering it is the source of Sauron’s power. Guided by Gandalf, Frodo leaves the Shire, forming a Fellowship of nine to destroy the Ring in Mount Doom, battling through dangers like the Mines of Moria before breaking apart at Amon Hen.",
            rating: 4,
            review: "A must read for all Tolkien fans!"
        ),
        
        Book(
            title: "The Two Towers",
            author: "J.R.R Tolkien",
            year: "1954",
            cover: "lotr_towers",
            summary: "The sequel to the Golden Globe-nominated and AFI Award-winning The Two Towers follows the continuing quest of Frodo and the Fellowship to destroy the One Ring. Frodo and Sam discover they are being followed by the mysterious Gollum. Aragorn, the Elf archer Legolas and Gimli the Dwarf encounter the besieged Rohan kingdom, whose once great King Theoden has fallen under Saruman's deadly spell.",
            rating: 3,
            review: "fan favorite!"
        ),
        
        Book(
            title: "The Return of the King",
            author: "J.R.R Tolkien",
            year: "1955",
            cover: "lotr_king",
            summary: "The culmination of nearly 10 years' work and conclusion to Peter Jackson's epic trilogy based on the timeless J.R.R. Tolkien classic, The Lord of the Rings: The Return of the King presents the final confrontation between the forces of good and evil fighting for control of the future of Middle-earth. Hobbits Frodo and Sam reach Mordor in their quest to destroy the `one ring', while Aragorn leads the forces of good against Sauron's evil army at the stone city of Minas Tirith.",
            rating: 5,
            review: "best book ever!"
        )
    ]
    
    var body: some View {
        TabView{
            NavigationView {
                List($books) { $book in
                    NavigationLink(destination: DetailView(book: $book)) {
                        ListView(book: book)
                    }
                }
                .navigationTitle(Text("Book Manager"))
                .navigationBarItems(trailing: Button("Add", action:{
                    showAddView.toggle()
                }))
                .sheet(isPresented: $showAddView){
                    if !newBook.title.isEmpty {
                        books.append(newBook)
                    }
                    newBook = Book(title: "", author: "", year: "", cover: "", summary: "", rating: 0, review: "")
                }content: {
                    AddEditView(book: $newBook)
                    
                }
            }.tabItem {
                Label("Books", systemImage: "books.vertical.fill")
            }
            FavoritesView(books: $books)
                .tabItem{
                    Label("Favorites", systemImage: "heart.fill")
                }
            
            }
        }
    }
    


//#Preview {
    //ContentView()
//}
