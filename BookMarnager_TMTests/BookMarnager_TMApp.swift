//
//  BookMarnager_TMApp.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/12/26.
//

import SwiftUI
import SwiftData

@main
struct BookMarnager_TMApp: App {
    
    let modelContainer: ModelContainer

        var body: some Scene {
            WindowGroup {
                ContentView()
                    .modelContainer(modelContainer)
            }
        }
        
        init(){
            do {
                modelContainer = try ModelContainer(
                    for: PersistentBook.self
                )
            } catch {
                fatalError("Failed to load model container")
            }
        }
    
}
