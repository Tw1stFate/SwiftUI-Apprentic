//
//  T_TextField.swift
//  SwiftUI-Apprentic
//
//  Created by zzz on 2022/5/16.
//

import SwiftUI

struct T_TextField: View {
    @State private var text = "Search"
    @State private var showT = ""
    @State private var isEditing = false
    var placeholder = "输入些文字..."
    
    @FocusState private var isFocus: Bool
    
    var body: some View {
        VStack {
            TextField(placeholder, text: $text)
                .padding()
                .border(.red, width: 5)
            
            // 样式设置
            TextField(placeholder, text: $text)
                .padding(20)
                .textFieldStyle(.roundedBorder) // textFieldStyle 有三个预置值 automatic、plain 和 roundedBorder。
                .multilineTextAlignment(.leading) // 对齐方式
                .font(.system(size: 14, weight: .heavy, design: .rounded))
                .border(.teal, width: 4)
                .background(.white)
                .foregroundColor(.brown)
                .textCase(.uppercase)
            
            // 多视图组合
            HStack {
                Image(systemName: "lock.circle")
                    .foregroundColor(.gray).font(.headline)
                TextField(placeholder, text: $text)
                    .textFieldStyle(.plain)
                    .submitLabel(.done)
                    .onSubmit {
                        showT = text
                        isFocus = true
                    }
                    .onChange(of: text) { newValue in
                        text = String(newValue.prefix(20)) // 限制字数
                    }
                Image(systemName: "eye.slash")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth: 1)
            )
            .padding(.horizontal)
            
            Text(showT)
                .padding()
            
            
            // 自定义 textFieldStyle 样式
            TextField(placeholder, text: $text)
                .padding()
                .textFieldStyle(PClearTextStyle())
                .focused($isFocus)
        }
        .padding()
    } // end body
}

struct PClearTextStyle: TextFieldStyle {
    @ViewBuilder
    func _body(configuration: TextField<_Label>) -> some View {
        let mirror = Mirror(reflecting: configuration)
        // 会crash, 可能是强制解包的原因
//        let bindingText: Binding<String> = mirror.descendant("_text") as! Binding<String>
        configuration
            .overlay(alignment: .trailing) {
                Button(action: {
//                    bindingText.wrappedValue = ""
                }, label: {
                    Image(systemName: "clear")
                })
            }
        
        let text: String = mirror.descendant("_text", "_value") as? String ?? ""
        configuration
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(text.count > 10 ? .pink : .gray, lineWidth: 4)
            )
    } // end func
}

struct T_TextField_Previews: PreviewProvider {
    static var previews: some View {
        T_TextField()
    }
}
