//
//  utils.test.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 3/7/26.
//

import Testing
@testable import BookMarnager_TM

@MainActor @Suite("Test utils")
struct UtilsTest {
    
    
    //Test case for filterFavoriteBook
    //[] Test if filter favorites
    //[] Test filter by genre
    //[] Test filter by reading status
    //[] Test filter with no results
    //[] Test by all of them
    
    
    @Test("Test filterFavoriteBooks filter favorite books")
    func testFilterFavoriteBook(){
        
        let books: [PersistentBook] = [
            PersistentBook(title:"Book 1"),
            PersistentBook(title:"Book 2", isFavorite: true),
            PersistentBook(title:"Book 3"),
        ]
        
        let filteredBooks = filterFavoriteBooks(books: books)
        
        
        #expect(filteredBooks.count == 1)
        #expect(filteredBooks.first? .title == "Book 2")
    }
    
    @Test("Test filterFavoriteBooks filter favorite books by genre")
    func testFilterFavoriteBooksByGenre(){
        
        let books: [PersistentBook] = [
            PersistentBook(title:"Book 1"),
            PersistentBook(title:"Book 2", isFavorite: true),
            PersistentBook(title:"Book 3", genre: .classic),
            PersistentBook(title:"Book 4", isFavorite: true, genre: .classic)
        ]
        
        
        let filteredBooks = filterFavoriteBooks(books: books, genre: .classic)
        
        #expect(filteredBooks.count == 1)
        #expect(filteredBooks.first? .title == "Book 4")
    }
    
    @Test("Test filterFavoriteBooks filter favorite books by reading status")
    func testFilterFavoriteBooksByReadingStatus(){
        
        let books: [PersistentBook] = [
            PersistentBook(title:"Book 1"),
            PersistentBook(title:"Book 2", isFavorite: true),
            PersistentBook(title:"Book 3", readingStatus: .planToRead),
            PersistentBook(title:"Book 4", isFavorite: true, readingStatus: .planToRead),
            PersistentBook(title:"Book 5", isFavorite: true, readingStatus: .dropped)
            
        ]
        
        let filteredBooks = filterFavoriteBooks(books: books, readingStatus: .planToRead)
        
        #expect(filteredBooks.count == 1)
        #expect(filteredBooks.first? .title == "Book 4")
    }
    
    @Test("Test filterFavoriteBooks filter favrite books none")
    func testFilterFavoriteBooksNone(){
        
        let  books: [PersistentBook] = [
            PersistentBook(title:"Book 1"),
            PersistentBook(title:"Book 2", isFavorite: true),
            PersistentBook(title:"Book 3", genre: .classic),
            PersistentBook(title:"Book 4", isFavorite: true, genre: .classic),
        ]
        
        let filteredBooks = filterFavoriteBooks(books: books, genre: .mystery)
        
        #expect(filteredBooks.count == 0)
    }
    // Assignment: it filters isFavorite, genre and reading status
    @Test("Test filterFavoriteBooks filter genre and readingStatus")
    func testFilterFavoriteBooksGenreAndReadingStatus(){
        
        let books: [PersistentBook] = [
            PersistentBook(title:"Book 1"),
            PersistentBook(title:"Book 2", isFavorite: true,),
            PersistentBook(title:"Book 3", isFavorite: true, genre: .romance, readingStatus: .finished)
        ]
        
        let filteredBooks = filterFavoriteBooks(books: books, genre: .romance, readingStatus: .finished)
        
        #expect(filteredBooks.count == 2)
        #expect(filteredBooks.first? .title == "Book 3")
        
    }
}
