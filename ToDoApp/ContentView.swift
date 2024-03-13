//
//  ContentView.swift
//  ToDoApp
//
//  Created by Tariq Almazyad on 13/03/2024.
//

import SwiftUI

struct TaskItem: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var details: String
    var isDone: Bool = false
    var dueDate: Date
    var timestamp: Date = .init()
}

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
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button {
                            withAnimation {
                                if let index = tasks.firstIndex(where: {$0.id == task.id}) {
                                    tasks.remove(at: index)
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
