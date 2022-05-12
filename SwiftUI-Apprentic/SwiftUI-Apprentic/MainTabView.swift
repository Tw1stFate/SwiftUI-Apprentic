//
//  MainTabView.swift
//  SwiftUI-Apprentic
//
//  Created by zzz on 2022/5/12.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ApprenticView()
                .tabItem {
                    Image(systemName: "testtube.2")
                        .foregroundColor(.blue)
                }
                .badge("1")
            
            DemosView()
                .tabItem {
                    Image(systemName: "archivebox")
                        .foregroundColor(.green)
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
