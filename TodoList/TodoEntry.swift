//
//  TodoEntry.swift
//  TodoList
//
//  Created by wonyoul heo on 5/24/24.
//

import UIKit

class TodoEntry {
    let date: Date
    let entryTitle: String
    let entryBody: String
    var completion: Bool
    var photo: UIImage?
    
    
    init?(title: String, body: String, completion: Bool ,photo: UIImage? = nil) {
        if title.isEmpty || body.isEmpty {
            return nil
        }
        self.date = Date()
        self.entryTitle = title
        self.entryBody = body
        self.completion = completion
        self.photo = photo
    }
}

struct SampleTodoEntryData {
    var todoEntries: [TodoEntry] = []
    
    mutating func createSampleTodoEntryData() {
        let photo1 = UIImage(systemName: "sun.max")
        let photo2 = UIImage(systemName: "cloud")
        let photo3 = UIImage(systemName: "cloud.sun")
        
        guard let todoEntry1 = TodoEntry(title: "wash Dishes", body: "I have to wash dishes",completion: false, photo: photo1) else {
            fatalError("Unable to instantiate todoEntry1")
        }
        guard let todoEntry2 = TodoEntry(title: "take a shower", body: "I have to take a shower",completion: false, photo: photo2) else {
            fatalError("Unable to instantiate todoEntry2")
        }
        guard let todoEntry3 = TodoEntry(title: "do the homework", body: "I have to do the homework",completion: false, photo: photo3) else {
            fatalError("Unable to instantiate todoEntry3")
        }
        todoEntries += [todoEntry1, todoEntry2, todoEntry3]
    }
}
