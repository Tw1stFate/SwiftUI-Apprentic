//
//  FloatBtn.swift
//  SwiftUI-Apprentic
//
//  Created by zzz on 2022/1/7.
//

import SwiftUI

struct FloatBtn: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundColor(Color(hue: 0.328, saturation: 0.796, brightness: 0.408))
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .frame(height: 50)
    }
}

struct FloatBtn_Previews: PreviewProvider {
    static var previews: some View {
        FloatBtn()
    }
}
