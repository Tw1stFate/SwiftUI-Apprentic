//
//  TodoView.swift
//  SwiftUI-Apprentic
//
//  Created by zzz on 2022/1/6.
//

import SwiftUI

struct TodoView: View {
    @StateObject var realmManager = RealmManager()
    @State var showAddTodoItemView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TaskView()
                .environmentObject(realmManager)
            FloatBtn()
                .padding()
                .onTapGesture {
                    showAddTodoItemView.toggle()
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
        .background(Color.red)
        .sheet(isPresented: $showAddTodoItemView) {
            AddTaskView()
                .environmentObject(realmManager)
        }
        .navigationTitle("Tasks")
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}

