//
//  ReadingStatus.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 3/2/26.
//

enum ReadingStatus: String, CaseIterable, Hashable, Codable {
    case planToRead = "Plan to read"
    case reading = "Reading"
    case dropped = "Dropped"
    case finished = "Finished"
    
    case unknown = "Unknown"
}
