//
//  Model.swift
//  ToDoApp
//
//  Created by Tariq Almazyad on 13/03/2024.
//

import Foundation

struct TaskItem: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var details: String
    var isDone: Bool = false
    var dueDate: Date
    var timestamp: Date = .init()
}
