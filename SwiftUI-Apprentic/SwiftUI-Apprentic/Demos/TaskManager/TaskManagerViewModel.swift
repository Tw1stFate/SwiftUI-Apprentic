//
//  TaskManagerViewModel.swift
//  SwiftUI-Apprentic
//
//  Created by zzz on 2022/5/17.
//

import SwiftUI
import CoreData

class TaskManagerViewModel: ObservableObject {
    @Published var currentTab: String = "Today"
    
    @Published var openEditTask: Bool = false
    @Published var taskTitle: String = ""
    @Published var taskColor: Color = .yellow
    @Published var taskDeadline: Date = Date()
    @Published var taskType: String = "Basic"
    
    // MARK: Adding Task to CoreData
    func addTask(context: NSManagedObjectContext) -> Bool {
        let task = Task(context: context)
        task.title = taskTitle
        task.color = taskColor.rawValue
        task.deadline = taskDeadline
        task.type = taskType
        
        if let _ = try? context.save() {
            return true
        }
        return false
    }
}

extension Color {
    var colorMap: [Color: String] {
    return [
        .yellow: "Yellow",
        .green: "Green",
        .blue: "Blue",
        .purple: "Purple",
        .red: "Red",
        .orange: "Orange",
        ]
    }
        
    var rawValue: String {
        guard let colorString = colorMap[self] else {
            return ""
        }
        return colorString
    }
}
