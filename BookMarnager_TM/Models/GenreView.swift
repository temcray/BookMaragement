//
//  GenreView.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/26/26.
//

import SwiftUI

enum Genre: String, CaseIterable, Hashable, Codable{
    case classic = "Classic"
    case fantasy = "Fantasy"
    case mystery = "Mystery"
    case romance = "Romance"
    case sciFi = "Sci-Fi"
    case thriller = "Thriller"
    case autobiography = "Autobiography"
    
    case unknown = "Unknown"
    
}
