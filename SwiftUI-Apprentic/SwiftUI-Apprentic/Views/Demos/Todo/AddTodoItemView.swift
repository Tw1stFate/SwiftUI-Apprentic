//
//  AddTodoItem.swift
//  SwiftUI-Apprentic
//
//  Created by zzz on 2022/1/6.
//

import SwiftUI

struct AddTodoItemView: View {
    @State var content = ""

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter your todo item", text: $content)
                .padding()
            Button {
                // save todo item
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
        AddTodoItemView()
    }
}
