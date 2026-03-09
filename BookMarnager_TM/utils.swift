//
//  utils.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 3/5/26.
//
/*[
book1:{
isFavorite: false
    genre: .classic
},
book2:{
isFavorite: true,
    genre: .classic
},
book3:{
isFavorite: true,
    genre: .fantasy
}
]*/

func filterFavoriteBooks(books: [PersistentBook], genre: Genre? = nil, readingStatus: ReadingStatus? = nil) -> [PersistentBook] {
    return books.filter{
        $0.isFavorite //true
        && (
            genre == nil //false
            || $0.genre == genre //false
        ) //false
        && (
            readingStatus == nil
            || $0.readingStatus == readingStatus
        )
    }
}
