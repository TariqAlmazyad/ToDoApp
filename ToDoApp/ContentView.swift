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
    @State var tasks: [TaskItem] = [ ]
    var body: some View {
        NavigationStack{
            List {
                ForEach(tasks) { task in
                    NavigationLink {
                        if let index = tasks.firstIndex(where: {$0.id == task.id}) {
                            EditTaskView(task: task, index: index, tasks: $tasks)
                        }
                    } label: {
                        TaskItemCellView(task: task)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button {
                            withAnimation {
                               deleteTask(task)
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
    
    func deleteTask(_ task: TaskItem) {
        if let index = tasks.firstIndex(where: {$0.id == task.id}) {
            tasks.remove(at: index)
        }
    }
}

#Preview {
    ContentView()
}


struct TaskItemCellView: View {
    var task: TaskItem
    var body: some View {
        HStack{
            Button(action: {
                
            }, label: {
                Image(systemName: task.isDone ? "checkmark.circle" :  "circle")
            }).buttonStyle(.borderless)
            VStack(alignment: .leading){
                Text(task.title)
                Text(task.details)
                // look for Date formatter in swift
                Text("\(task.dueDate.formatted(.dateTime.day().month().year()))")
            }
        }
    }
}
