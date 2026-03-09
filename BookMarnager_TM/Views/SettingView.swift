//
//  SettingView.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/26/26.
//

import SwiftUI

struct SettingView: View {
    @AppStorage(SETTING_THEME_KEY) private var currentTheme: Theme = .system
    @AppStorage(SETTING_GRID_COLUMNS) private var gridColumns: Int = 2
    @AppStorage(SETTING_ACCENT_COLOR_KEY) private var accoentColor: Color = .blue
    
    
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Appearance")){
                    Picker("Theme", selection: $currentTheme){
                        ForEach(Theme.allCases, id:\.self){ theme in
                            Text(theme.rawValue).tag(theme)
                        }
                    }
                    ColorPicker("Accent Color", selection: $accoentColor)
                }
                Section(header: Text("Favorites view")){
                    Stepper("Columns: \(gridColumns)", value: $gridColumns, in: 1...4)
                }
            }
        }
        
    }
}

//#Preview {
    //SettingView()
//}
