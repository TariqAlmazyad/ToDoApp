//
//  EditTaskView.swift
//  ToDoApp
//
//  Created by Tariq Almazyad on 13/03/2024.
//

import SwiftUI

struct EditTaskView: View {
    var task: String
    var index: Int
    @State var taskTemp: String = ""
    @Binding var tasks: [String]
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Bootcamp labs", text: $taskTemp)
                } header: {
                    Text("Add title")
                } footer: {
                    Text("You can add title to to your task to priorities your goal  ")
                }
                
                Button {
                   tasks[index] = taskTemp
                    dismiss()
                } label: {
                    Text("Update Task")
                        .frame(maxWidth: .infinity, alignment: .center)
                }.buttonStyle(.borderless)

            }
            .navigationTitle("Edit Task")
            .navigationBarTitleDisplayMode(.large)
        }
        .onAppear{
            taskTemp = task
        }
    }
}

#Preview {
    EditTaskView(task: "", index: 0 ,tasks: .constant([]))
}
