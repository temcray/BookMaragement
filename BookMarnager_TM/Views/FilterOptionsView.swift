import SwiftUI

struct FilterOptionsView: View {
    @Binding var selectedGenre: Genre?
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            List {
                Section("Genres") {
                    if let genres = allGenres() {
                        ForEach(genres, id: \.self) { genre in
                            HStack {
                                Text(displayName(for: genre))
                                Spacer()
                                if selectedGenre == genre {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(.accent)
                                }
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if selectedGenre == genre {
                                    selectedGenre = nil
                                } else {
                                    selectedGenre = genre
                                }
                            }
                        }
                    } else {
                        Text("Genres list unavailable. Make sure `Genre` conforms to CaseIterable.")
                            .foregroundStyle(.secondary)
                    }
                }

                Section {
                    Button(role: .none) {
                        selectedGenre = nil
                    } label: {
                        Label("Clear filter", systemImage: "xmark.circle")
                    }
                }
            }
            .navigationTitle("Filter")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                        .accessibilityLabel("Dismiss filter options")
                }
            }
        }
    }

    // Helper to access all genres if Genre is CaseIterable
    private func allGenres() -> [Genre]? {
        // Attempt to cast to CaseIterable at runtime
        if let type = Genre.self as? any CaseIterable.Type,
           let cases = type.allCases as? [Genre] {
            return cases
        }
        return nil
    }

    private func displayName(for genre: Genre) -> String {
        // If Genre is RawRepresentable<String>, use rawValue; otherwise use String(describing:)
        if let raw = (genre as Any) as? any RawRepresentable,
           let stringRaw = (raw.rawValue as? String) {
            return stringRaw
        }
        return String(describing: genre)
    }
}

#if DEBUG
#if !canImport(Genre)
private enum Genre: String, CaseIterable {
    case action = "Action"
    case comedy = "Comedy"
    case drama = "Drama"
}
#endif

struct FilterOptionsView_Previews: PreviewProvider {
    struct PreviewHost: View {
        @State var selected: Genre? = nil
        var body: some View {
            FilterOptionsView(selectedGenre: $selected)
        }
    }

    static var previews: some View {
        PreviewHost()
    }
}
#endif
