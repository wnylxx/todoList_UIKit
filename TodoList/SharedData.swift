//
//  SharedData.swift
//  TodoList
//
//  Created by wonyoul heo on 5/24/24.
//

import UIKit

class SharedData {
    static let shared = SharedData()
    private var todoEntries: [TodoEntry]
    
    private init() {
        todoEntries = []
    }
    
    func numberOfTodoEntries() -> Int {
        todoEntries.count
    }
    
    func getTodoEntry(index: Int) -> TodoEntry {
        todoEntries[index]
    }
    
    func getAllTodoEntries() -> [TodoEntry] {
        let readOnlyTodoEntries = todoEntries
        return readOnlyTodoEntries
    }
    
    func addTodoEntry(newTodoEntry: TodoEntry) {
        todoEntries.append(newTodoEntry)
    }
    
    func removeTodoEntry(index: Int){
        todoEntries.remove(at: index)
    }
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadTodoEntries() {
        let fileURL = getDocumentDirectory().appendingPathComponent("todoEntries.json")
        do {
            let data = try Data(contentsOf: fileURL)
            let todoEntriesData = try JSONDecoder().decode([TodoEntry].self, from: data)
            todoEntries = todoEntriesData
        } catch {
            print("Failed to read Json data: \(error.localizedDescription)")
        }
    }
    
    func saveTodoEntries() {
        let pathDirectory = getDocumentDirectory()
        try? FileManager.default.createDirectory(at: pathDirectory, withIntermediateDirectories: true)
        let fileURL = pathDirectory.appendingPathComponent("todoEntries.json")
        let json = try? JSONEncoder().encode(todoEntries)
        do {
            try json!.write(to: fileURL)
        } catch {
            print("Faild to write Json data: \(error.localizedDescription)")
        }
    }
    
}
