//
//  ListView.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/24/26.
//

import SwiftUI
import SwiftData

struct ListView: View {
    @Query var books: [PersistentBook]
    
    @State private var showAddSheet = false
    
    
    var body: some View {
        NavigationStack{
            List(books, id:\.self.id){ book in
                NavigationLink(destination: DetailView(book: book)){
                    ListItemView(book: book)
                }
            }
            .navigationTitle("Book Manager")
            .navigationBarItems(trailing: Button("Add", action:{
                showAddSheet.toggle()
            }))
            .sheet(isPresented: $showAddSheet){
           
            }content:{
                    AddEditView()
                
            }
        }
    }
}
