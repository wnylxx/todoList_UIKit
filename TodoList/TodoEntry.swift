//
//  TodoEntry.swift
//  TodoList
//
//  Created by wonyoul heo on 5/24/24.
//

import UIKit

class TodoEntry: NSObject ,Codable {
    let date: Date
    let entryTitle: String?
    let entryBody: String?
    var isCompleted: Bool
    
    
    init(date: Date, title: String, body: String, isCompleted: Bool) {
        self.date = date
        self.entryTitle = title
        self.entryBody = body
        self.isCompleted = isCompleted
    }
    
    enum CodingKeys: String, CodingKey {
        case date, entryTitle, entryBody, isCompleted
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try container.decode(Date.self, forKey: .date)
        entryTitle = try container.decode(String.self, forKey: .entryTitle)
        entryBody = try container.decode(String.self, forKey: .entryBody)
        isCompleted = try container.decode(Bool.self, forKey: .isCompleted)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(date, forKey: .date)
        try container.encode(entryTitle, forKey: .entryTitle)
        try container.encode(entryBody, forKey: .entryBody)
        try container.encode(isCompleted, forKey: .isCompleted)
    }
}
