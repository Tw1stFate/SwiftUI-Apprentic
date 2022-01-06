//
//  TodoView.swift
//  SwiftUI-Apprentic
//
//  Created by zzz on 2022/1/6.
//

import SwiftUI

struct TodoView: View {
    @State var showAddTodoItemView = false
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: TodoDetailView(content: "content")) {
                    HStack {
                        Image(systemName: "circle")
                        Text("Study")
                    }
                }
            }
            .navigationTitle("Todo")
            .navigationBarItems(trailing: Button(action: {
                showAddTodoItemView.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showAddTodoItemView) {
                AddTodoItemView()
            }
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
