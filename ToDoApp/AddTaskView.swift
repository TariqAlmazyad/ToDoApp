//
//  AddTaskView.swift
//  ToDoApp
//
//  Created by Tariq Almazyad on 13/03/2024.
//

import SwiftUI

struct AddTaskView: View {
    @State var taskTitle: String = ""
    @State var taskDetails: String = ""
    @State var dueDate: Date = .init()
    @Binding var tasks: [TaskItem]
    @Binding var isShowingAddNewTaskView: Bool
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Bootcamp labs",  text: $taskTitle)
                    TextField("write details", text: $taskDetails)
                    DatePicker(selection: $dueDate) {
                        Text("Due date")
                    }
                } header: {
                    Text("Add title")
                } footer: {
                    Text("You can add title to to your task to priorities your goal  ")
                }
                
                Button {
                    let taskItem = TaskItem(title: taskTitle, details: taskDetails, dueDate: dueDate)
                   addNewTask(taskItem)
                } label: {
                    Text("Add Task")
                        .frame(maxWidth: .infinity, alignment: .center)
                }.buttonStyle(.borderless)

            }
            .navigationTitle("Add Task")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    func addNewTask(_ task: TaskItem) {
        tasks.append(task)
        isShowingAddNewTaskView = false
    }
    
}

#Preview {
    NavigationStack{
        AddTaskView(tasks: .constant([]),
                    isShowingAddNewTaskView: .constant(false))
            .navigationTitle("Add Task")
    }
}
