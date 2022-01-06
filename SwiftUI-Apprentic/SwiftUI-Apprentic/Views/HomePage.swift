//
//  ContentView.swift
//  SwiftUI-Apprentic
//
//  Created by Zzz on 2021/12/11.
//

import SwiftUI

struct HomePage: View {
    @State var showAddItemView = false
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(0 ..< 5) { item in
                    NavigationLink(destination: TodoView()) {
                        Text("🧞‍♀️Todo Demo")
                    }
                }
            }
            .navigationTitle("SwiftUI-Apprentic")
            .navigationBarItems(trailing: Button(action: {
                showAddItemView.toggle()
            }, label: {
                Image(systemName: "plus")
                    .background(Color.red)
                    .cornerRadius(10.0)
            }))
            .sheet(isPresented: $showAddItemView) {
                Text("+")
            }
        }
        .background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
