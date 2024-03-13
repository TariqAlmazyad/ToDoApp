//
//  AddTaskView.swift
//  ToDoApp
//
//  Created by Tariq Almazyad on 13/03/2024.
//

import SwiftUI

struct AddTaskView: View {
    @State var taskTitle: String = ""
    var body: some View {
        Form {
            Section {
                TextField("Bootcamp labs", text: $taskTitle)
            } header: {
                Text("Add title")
            } footer: {
                Text("You can add title to to your task to priorities your goal  ")
            }
            
            Button {
                
            } label: {
                Text("Add Task")
                    .frame(maxWidth: .infinity, alignment: .center)
            }.buttonStyle(.borderless)

        }
        .navigationTitle("Add Task")
    }
}

#Preview {
    NavigationStack{
        AddTaskView()
            .navigationTitle("Add Task")
    }
}
