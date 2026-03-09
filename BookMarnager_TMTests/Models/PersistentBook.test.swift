//
//  PersistentBook.test.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 3/7/26.
//

import Testing
@testable import BookMarnager_TM
import Foundation


@MainActor @Suite("PersistentBook Model Test")
struct PersistentBookTest {
    @Test("PersistentBook initialization with just title")
    func persistentBookInit(){
        
        let title = "Test Book"
        
        let book = PersistentBook(title: title)
        
        #expect(book.title == title)
        #expect(book.author == "")
        #expect(book.coverData == nil)
        #expect(book.summary == "")
        #expect(book.rating == 0)
        #expect(book.review == "")
        #expect(book.isFavorite == false)
        #expect(book.genre == .unknown)
        #expect(book.readingStatus == .unknown)
    }
    
    @Test("PersistentBook initialization with all data set")
    func persistentBookinitAllData(){
        
        let title = "Test Book"
        let author = "Author Name"
        let coverData: Data? = Data((0..<1024).description.utf8)
        let summary = "A short summary of the book"
        let rating: Int = 4
        let review = "A review of the book"
        let isFavorite: Bool = true
        let genre: Genre = .fantasy
        let readingStatus: ReadingStatus = .finished
        
        
        let book = PersistentBook(
            title: title,
            author: author,
            coverData: coverData,
            summary: summary,
            rating: rating,
            review: review,
            isFavorite: isFavorite,
            genre: genre,
            readingStatus: readingStatus
        )
        
        #expect(book.title == title)
        #expect(book.author == author)
        #expect(book.coverData == coverData)
        #expect(book.summary == summary)
        #expect(book.review == review)
        #expect(book.isFavorite == isFavorite)
        #expect(book.genre == genre)
        #expect(book.readingStatus == readingStatus)
        
        
        let book2 = PersistentBook(book)
        #expect(book2.title == title)
        #expect(book2.author == author)
        #expect(book2.coverData == coverData)
        #expect(book2.summary == summary)
        #expect(book2.review == review)
        #expect(book2.isFavorite == isFavorite)
        #expect(book2.genre == genre)
        #expect(book2.readingStatus == readingStatus)
        
        
        
        
        
    }
}
