//
//  T_SafeAreaView.swift
//  SwiftUI-Apprentic
//
//  Created by zzz on 2022/5/12.
//

import SwiftUI

struct T_SafeAreaView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                ForEach(0...30, id: \.self) { _ in
                    HStack {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 45, height: 45)
                        VStack {
                            Rectangle()
                                .fill(Color.green)
                                .frame(height: 15)
                            Rectangle()
                                .fill(Color.green)
                                .frame(height: 15)
                                .padding(.trailing, 50)
                        }
                    }
                }
            }.padding()
        }
        .safeAreaInset(edge: .bottom) {
            // 会自动在指定位置添加额外的内边距
            Capsule()
                .fill(Color.red)
                .frame(height: 55)
        }
        
    }
}

struct T_SafeAreaView_Previews: PreviewProvider {
    static var previews: some View {
        T_SafeAreaView()
    }
}
