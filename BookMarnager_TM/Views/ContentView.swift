//
//  ContentView.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/12/26.
//

import SwiftUI

struct ContentView: View {
    @AppStorage(SETTING_THEME_KEY) private var theme: Theme = .system
    @AppStorage(SETTING_ACCENT_COLOR_KEY) private var accentColor: Color = .blue
    
    var colorScheme: ColorScheme? {
        switch theme {
        case .system:
            return nil
        case .dark:
            return .dark
            
        case .light:
            return .light
            
        }
    }
    
    var body: some View {
        TabView{
            ListView()
                .tabItem{
                    Label("Books", systemImage: "books.vertical.fill")
                }
            FavoritesView()
                .tabItem{
                    Label("Favorite", systemImage: "heart.fill")
                }
            SettingView()
                .tabItem{
                    Label("Setting", systemImage: "gear")
                }
        }
        .tint(accentColor)
        .preferredColorScheme(colorScheme)
    }
}
