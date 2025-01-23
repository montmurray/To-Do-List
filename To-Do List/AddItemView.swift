//
//  AddItemView.swift
//  To-Do List
//
//  Created by Tessa Murray on 1/23/25.
//

import SwiftUI

struct AddItemView: View {
    @ObservedObject var toDoList: ToDoList
    @State private var showingAddItemView = false
    @State private var priority = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode; static let priorities = ["High", "Medium", "Low"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Priority", selection: $priority) {
                    ForEach(Self.priorities, id: \.self) { priority in Text(priority) }
                    
                }
            }
            .navigationBarTitle("Add New To-Do Item", displayMode: .inline)
            .sheet(isPresented: $showingAddItemView, content: {
                AddItemView(toDoList: toDoList)
            })
            .navigationBarItems(leading: EditButton(), trailing: Button(action: { showingAddItemView = true }, label: { Image(systemName: "plus")
            }))
            TextField("Description", text: $description)
            DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
        }
    }
}

#Preview {
    AddItemView(toDoList: ToDoList())
}
