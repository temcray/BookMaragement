//
//  AddEditView.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/20/26.
//

import SwiftUI
import SwiftData

struct AddEditView: View {
    
    var book: PersistentBook?
    @StateObject private var viewModel: AddEditViewModel
    @Environment(\.dismiss) var dismiss
    //@Environment(\.modelContext) private var modelContext
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var year : String = ""
    @State private var summary: String = ""
    @State private var rating: Int = 0
    @State private var review: String = ""
    @State private var isFavorite: Bool = false
    @State private var genre: Genre = .unknown
    @State private var readingStatus: ReadingStatus = .unknown
    @State private var coverData: Data?
    
    init(book: PersistentBook?, modelContext: ModelContext){
        _viewModel = StateObject(
            wrappedValue: AddEditViewModel(book: book, modelContext: modelContext
            )
        )
    }
    var body: some View {
        NavigationStack{
            var _ = print(title)
            Form{
                Section(header: Text("Book details")){
                    TextField("Title of the book", text: $viewModel.title)
                    TextField("Author", text: $viewModel.author)
                    TextEditor( text: $viewModel.summary)
                        .frame(height: 150)
                    Picker("Genre", selection: $viewModel.genre){
                        ForEach(Genre.allCases, id:\.self){ genre in
                            Text(genre.rawValue).tag(genre)
                            
                        }
                    }
                    
                }
                Section(header: Text("Cover")){
                    ImageFieldView(data: $viewModel.coverData)
                }
                Section(header: Text("Review")){
//                    Picker("Rating", selection: $rating){
//                        Text("Select a rating..,").tag(0)
//                        ForEach(1...5, id: \.self){
//                            Text("\($0)").tag($0)
//                        }
//                    }
                    Picker("Reading status", selection: $viewModel.readingStatus){
                        ForEach(ReadingStatus.allCases, id:\.self){ readingStatus in
                            Text(readingStatus.rawValue).tag(readingStatus)
                            
                        }
                    }
                    StarRatingField(rating: $viewModel.rating)
                    TextEditor(text: $viewModel.review)
                        .frame(height:150)
                }
            }
            .navigationTitle($viewModel.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .primaryAction){
                    FavoriteToggle(isFavorite: $viewModel.isFavorite)
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        viewModel.saveBook()
                        dismiss()
                        
                    }.disabled(viewModel.isNotSaveable)
                }
            }
        }
    }
}
