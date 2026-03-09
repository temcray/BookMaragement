//
//  PersistentBook.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/28/26.
//

import Foundation
import SwiftData
import UIKit

@Model
class PersistentBook{
    var title: String
    var author: String
    var year: String
    var coverData: Data?
    var summary: String
    var rating: Int
    var review: String
    var isFavorite: Bool 
    var genre: Genre 
    var readingStatus: ReadingStatus
    
    init(_ book: PersistentBook){
        self.title = book.title
        self.author = book.author
        self.year = book.year
        self.coverData = book.coverData
        self.summary = book.summary
        self.rating = book.rating
        self.review = book.review
        self.isFavorite = book.isFavorite
        self.genre = book.genre
        self.readingStatus = book.readingStatus
    }
    
    init(
     title: String,
     author: String = "",
    year: String = "",
     coverData: Data? = nil,
     summary: String = "",
    rating: Int = 0,
     review: String = "",
     isFavorite: Bool = false,
     genre: Genre = .unknown,
    readingStatus: ReadingStatus = .unknown,
    
    ){
        self.title = title
        self.author = author
        self.year = year
        self.coverData = coverData
        self.summary = summary
        self.rating = rating
        self.review = review
        self.isFavorite = isFavorite
        self.genre = genre
        self.readingStatus = readingStatus
        
    }
    
    //computed property
        var cover: UIImage {
            if self.coverData != nil {
                return UIImage(data: self.coverData!)!
            } else{
                return UIImage(resource: .lotrKing)
            }
        }
    }

