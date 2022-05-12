//
//  T_TabView.swift
//  SwiftUI-Apprentic
//
//  Created by zzz on 2022/5/12.
//

import SwiftUI

struct T_TabView: View {
    var body: some View {
        TabView {
            Color.red
                .tabItem {
                    Image(systemName: "house.fill")
                }
                .badge("10")

            Color.green
                .tabItem {
                    Image(systemName: "suit.heart.fill")
                }

            Color.blue
                .tabItem {
                    Image(systemName: "gearshape")
                }
        }
    }
}

struct T_TabView_Previews: PreviewProvider {
    static var previews: some View {
        T_TabView()
    }
}
