//
//  AddTodoItem.swift
//  SwiftUI-Apprentic
//
//  Created by zzz on 2022/1/6.
//

import SwiftUI

@available(iOS 15.0, *)
struct AddTaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var title = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(alignment: .leading) {
            Text("Creat new task")
                .font(.title).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter your todo item", text: $title)
                .padding()
            Button {
                // save task item
                if title != "" {
                    realmManager.addTask(title: title)
                }
                dismiss()
            } label: {
                Image(systemName: "plus")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .background(Color.green)
    }
}

struct AddTodoItem_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
