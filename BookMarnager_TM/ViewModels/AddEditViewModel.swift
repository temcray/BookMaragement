
//  AddEditViewModel.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 3/7/26.
//

import SwiftUI
import SwiftData
internal import Combine


@MainActor
class AddEditViewModel: ObservableObject{
    private var book: PersistentBook?
    private let modelContext: ModelContext
    
    @Published var title: String = ""
    @Published var author: String = ""
    @Published var year: String =  ""
    @Published var summary: String = ""
    @Published var rating: Int = 0
    @Published var review: String = ""
    @Published var isFavorite: Bool
    @Published var genre: Genre
    @Published var readingStatus:  ReadingStatus
    @Published var coverData: Data?
    
    var nagigationTitle: String {
        book == nil ? "Add Book" : "Edit Book"
    }
    
    var isNotSaveable: Bool {
        title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        || title == book?.title
            && author == book?.author
            && year == book?.year
            && summary == book?.summary
            && rating == book?.rating
            && review == book?.review
            && isFavorite == book?.isFavorite
            && genre == book?.genre
            && readingStatus == book?.readingStatus
            && coverData == book?.coverData
                       
    }
    
    
    init(book: PersistentBook? = nil, modelContext: ModelContext) {
        self.book = book
        self.modelContext = modelContext
       if let book{
            
            print(book)
            title = book.title
            author = book.author
            year = book.year
            summary = book.summary
            rating = book.rating
            review = book.review
            isFavorite = book.isFavorite
            genre = book.genre
            readingStatus = book.readingStatus
            coverData = book.coverData
        }else {
            title = ""
            author = ""
            year = ""
            summary = ""
            rating = 0
            review = ""
            isFavorite = false
            genre = .unknown
            readingStatus = .unknown
            coverData = nil
        }
        
    }
    func saveBook(){
        let isNewBook = book  == nil
        let bookToSave = book ?? PersistentBook(title: title)
        bookToSave.title = title
        bookToSave.author = author
        bookToSave.year = year
        bookToSave.summary = summary
        bookToSave.rating = rating
        bookToSave.review = review
        bookToSave.isFavorite = isFavorite
        bookToSave.readingStatus = readingStatus
        bookToSave.genre = genre
        
        if (coverData != nil){
            bookToSave.coverData = coverData
        }
        print(bookToSave)
        if isNewBook{
            modelContext.insert(bookToSave)
        }
        
        do {
            try modelContext.save()
        }catch {
            print("Failed to save the book: \(error)")
        }
    }
}
