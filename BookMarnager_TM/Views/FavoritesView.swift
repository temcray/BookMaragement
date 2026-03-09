//
//  FavoritesView.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/21/26.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Query var books: [PersistentBook]
    @State private var isFilterSheetPresented: Bool = false
    @State private var selectedGenre: Genre?
    @State private var selectedReadingStatus: ReadingStatus?
    @AppStorage("SETTING_GRID_COLUMNS") private var gridColumns: Int = 2
    
    private var favoriteBooks: [PersistentBook] {
        filterFavoriteBooks(books: books, genre: selectedGenre, readingStatus:
        selectedReadingStatus)
    }
    
    private var gridLayout: [GridItem] {
        Array(repeating: GridItem(.flexible()), count: max(gridColumns, 1))
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                if let selectedGenre {
                    Text("Filtering by genre: \(selectedGenre.rawValue)")
                }

                if favoriteBooks.isEmpty {
                    Text("No favorite books")
                        .foregroundColor(.secondary)
                } else {
                    LazyVGrid(columns: gridLayout) {
                        ForEach(favoriteBooks) { book in
                            SquareCardView(book: book)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("My favorite books")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { isFilterSheetPresented.toggle() }) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                    }
                    .accessibilityLabel("Open filter options")
                }
            }
            .sheet(isPresented: $isFilterSheetPresented) {
                FilterOptionsView(selectedGenre: $selectedGenre, selectedReadingStatus: $selectedReadingStatus)
            }
        }
    }
}

//func filterFavoriteBooks(books: [PersistentBook], genre: Genre?, readingStatus: ReadingStatus?) -> [PersistentBook] {
//    return books.filter{
//        $0.isFavorite //true
//        && (
//            genre == nil //false
//            || $0.genre == genre //false
//        ) //false
//        && (
//            readingStatus == nil
//            || $0.readingStatus == readingStatus
//        )
//    }


//#Preview {
//    FavoritesView(books: .constant([]))
//}

