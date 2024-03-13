//
//  AddTaskView.swift
//  ToDoApp
//
//  Created by Tariq Almazyad on 13/03/2024.
//

import SwiftUI

struct AddTaskView: View {
    @State var taskTitle: String = ""
    @Binding var tasks: [String]
    @Binding var isShowingAddNewTaskView: Bool
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Bootcamp labs", text: $taskTitle)
                } header: {
                    Text("Add title")
                } footer: {
                    Text("You can add title to to your task to priorities your goal  ")
                }
                
                Button {
                    tasks.append(taskTitle)
                    isShowingAddNewTaskView = false
                } label: {
                    Text("Add Task")
                        .frame(maxWidth: .infinity, alignment: .center)
                }.buttonStyle(.borderless)

            }
            .navigationTitle("Add Task")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    NavigationStack{
        AddTaskView(tasks: .constant([]),
                    isShowingAddNewTaskView: .constant(false))
            .navigationTitle("Add Task")
    }
}
