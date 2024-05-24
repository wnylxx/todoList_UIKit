//
//  TodoEntry.swift
//  TodoList
//
//  Created by wonyoul heo on 5/24/24.
//

import UIKit

class TodoEntry {
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
}
