//
//  DetailView.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/19/26.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    var book: PersistentBook
    @State private var showEditSheet: Bool = false
    @State private var isFavorite: Bool = false
    @Environment(\.modelContext) private var modelContext
    init(book:PersistentBook){
            self.book = book
            self.isFavorite = book.isFavorite
        }
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    Image(uiImage:book.cover)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 150)
                        .padding()
                    
                    VStack(alignment: .leading){
                        Text(book.title)
                            .font(.headline)
                        Text("by\(book.author)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        HStack{
                            CustomCapsuleView(text: book.genre.rawValue, color: .red)
                            CustomCapsuleView(text: book.readingStatus.rawValue, color: .blue)
                            Spacer()
                            FavoriteToggle(isFavorite: $isFavorite)
                                .onChange(of:isFavorite){
                                    book.isFavorite = isFavorite
                                    try? modelContext.save()
                                }
                        }
                    }
                    
                }
                
                Text(book.summary)
                
                if(book.rating > 0 || !book.review.isEmpty){
                    VStack(alignment: .leading){
                        HStack{
                            Text("Review")
                                .font(.title2)
                                .bold()
                            Spacer()
                            
                            StarRatingView(rating: book.rating)
                        }
                        Text(book.review)
                    }.padding(.vertical, 10)
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button("Edit", action:{
            showEditSheet.toggle()
        }))
        .sheet(isPresented: $showEditSheet){
            AddEditView(book: book, modelContext: modelContext)
        }
    }
}
