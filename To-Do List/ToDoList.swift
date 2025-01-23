//
//  ToDoList.swift
//  To-Do List
//
//  Created by Tessa Murray on 1/23/25.
//

import SwiftUI

class ToDoList: ObservableObject {
    
    @Published var items = [ToDoItem(priority: "High", description: "Take out trash", dueDate: Date()),
                            
                            ToDoItem(priority: "Medium", description: "Pick up clothes", dueDate: Date()),
                            
                            ToDoItem(priority: "Low", description: "Eat a donut", dueDate: Date())]
    init() {
        if let data = UserDefaults.standard.data(forKey: "data") {
            if let decodedData = try? JSONDecoder().decode([ToDoItem].self, from: data) {
                items = decodedData
                return
            }
        }
        items = []
    }
}
