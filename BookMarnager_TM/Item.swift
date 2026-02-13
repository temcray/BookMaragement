//
//  Item.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 2/12/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
