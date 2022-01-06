//
//  TodoDetailView.swift
//  SwiftUI-Apprentic
//
//  Created by zzz on 2022/1/6.
//

import SwiftUI

struct TodoDetailView: View {
    var content: String
    
    var body: some View {
        Text(content)
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(content: "")
    }
}
