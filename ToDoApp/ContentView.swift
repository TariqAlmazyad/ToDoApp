//
//  ContentView.swift
//  ToDoApp
//
//  Created by Tariq Almazyad on 13/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            List {
                ForEach(0 ..< 5) { item in
                    Text("123")
                        .swipeActions{
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "trash")
                                    .tint(.red)
                            })
                        }
                }
            }
            .navigationTitle("To Do")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}, label: {
                        Image(systemName: "plus")
                    })
                }
            })
        }
    }
}

#Preview {
    ContentView()
}
