//
//  ContentView.swift
//  ToDoApp
//
//  Created by Tariq Almazyad on 13/03/2024.
//

import SwiftUI

struct ContentView: View {
    // step 1 : create var to show/hide
    @State var isShowingAddNewTaskView: Bool = false
    @State var tasks: [String] = []
    var body: some View {
        NavigationStack{
            List {
                ForEach(tasks, id:\.self) { task in
                    NavigationLink {
                        if let index = tasks.firstIndex(of: task) {
                            EditTaskView(task: task, index: index, tasks: $tasks)
                        }
                    } label: {
                        Text(task)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button {
                            withAnimation {
                                if let deletedTaskIndex = tasks.firstIndex(where: {$0 == task}) {
                                    tasks.remove(at: deletedTaskIndex)
                                }
                            }
                        } label: {
                            Image(systemName: "trash")
                                .tint(.red)
                        }

                    }
                }
            }
            .navigationTitle("To Do")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingAddNewTaskView.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            })
        }
//        .fullScreenCover(isPresented: $isShowingAddNewTaskView, content: {
//            NavigationStack{
//                AddTaskView()
        //            }
        //        })
        .sheet(isPresented: $isShowingAddNewTaskView) {
            AddTaskView(tasks: $tasks,
                        isShowingAddNewTaskView: $isShowingAddNewTaskView)
        }
        
    }
}

#Preview {
    ContentView()
}
