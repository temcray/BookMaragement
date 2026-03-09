//
//  CustomCapsuleView.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/26/26.
//

import SwiftUI

struct CustomCapsuleView: View {
    var text: String
    var color: Color = .accentColor
    
    var body: some View {
        Text(text)
            .font(.caption)
            .fontWeight(.bold)
            .padding(8)
            .background(color.opacity(0.3))
            .clipShape(Capsule())
        
    }
}

//#Preview {
    //CustomCapsuleView()
//}
