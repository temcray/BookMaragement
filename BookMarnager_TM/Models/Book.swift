//
//  Book.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/17/26.
//

import Foundation

struct Book: Identifiable {
    let id: UUID = UUID()
    var title: String
    var author: String
    var cover: String
    var summary: String
    var rating: Int = 0
    var review: String = ""
    var isFavorite: Bool = false
    var genre: Genre = .unknown
    var readingStatus: ReadingStatus = .unknown
    
        
    
}

