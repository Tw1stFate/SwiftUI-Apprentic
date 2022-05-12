//
//  TaskView.swift
//  SwiftUI-Apprentic
//
//  Created by zzz on 2022/1/7.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var realmManager: RealmManager

    var body: some View {
        VStack {
            
            List {
                ForEach(realmManager.tasks, id: \.id) { task in
                    if !task.isInvalidated {
                        TodoListRow(task: task)
                            .onTapGesture {
                                realmManager.updateTask(id: task.id, completed: !task.completed)
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    realmManager.deleteTask(id: task.id)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                                
                            }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .onAppear(perform: {
                UITableView.appearance().backgroundColor = .clear
                UITableViewCell.appearance().backgroundColor = .clear
            })
        }
        .background(Color(hue: 1.0, saturation: 0.256, brightness: 0.868))
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
            .environmentObject(RealmManager())
    }
}

struct TodoListRow: View {
    var task: Task
    var body: some View {
        HStack {
            Image(systemName: task.completed ? "checkmark.circle" : "circle")
            Text(task.title)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
