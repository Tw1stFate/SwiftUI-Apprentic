//
//  SwiftUIView-iOS15.swift
//  SwiftUI-Apprentic
//
//  Created by zzz on 2022/5/12.
//

import SwiftUI

struct SwiftUIView_iOS15: View {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
    
    @State var users: [User] = []
    @State var searchText = ""
    @State var showSheet = false
    
    var body: some View {
        NavigationView {
            List(users) { user in
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.name)
                    Text(user.email)
                }
                // 设置分割线
                .listRowSeparatorTint(.red)
                .listRowSeparator(.visible, edges: .all)
                // 设置左滑/右滑显示操作按钮
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    Button {
                        
                    } label: {
                        Image(systemName: "house.fill")
                    }
                    .tint(.red)
                }
            }
            // 列表样式
            .listStyle(.grouped)
            // 下拉刷新
            .refreshable {
                await fetchUsers()
            }
            .searchable(text: $searchText) { //仅适用于NavigationView
                // 返回建议视图, 并非搜索结果
                // 点击提示的字符, 会自动补全为提供的字符
                Text("🍎").searchCompletion("apple")
                Text("🍐").searchCompletion("pear")
                Text("🍌").searchCompletion("banana")
                ForEach(
                    users.filter {
                        searchText == "" ? true : $0.email.lowercased().contains(searchText.lowercased())
                    }
                ) { user in
                    Text(user.email)
                        .searchCompletion(user.name)
                }
            }
//            .onSubmit(of: [.search, .text], {
            .onSubmit(of: .search, {
                print("搜索/文本输入框提交")
            })
            // navigation item
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            })
            // sheet
            .sheet(isPresented: $showSheet, content: {
                Text("Sheet View")
                // 可以禁用通过下滑手势关闭sheet, 注意在sheet内容里使用
                    .interactiveDismissDisabled(true)
            })
            .navigationTitle("Pull to Refresh")
        }
        
    }
    
    func fetchUsers() async {
        let session = URLSession(configuration: .default)
        do {
            let task = try await session.data(from: url)
            let users = try JSONDecoder().decode([User].self, from: task.0)
            self.users = users
        } catch {
            print("fail to fetch users")
        }
    }
}

struct User: Identifiable, Decodable {
    var id: Int
    var name: String
    var email: String
}

struct SwiftUIView_iOS15_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_iOS15()
    }
}
