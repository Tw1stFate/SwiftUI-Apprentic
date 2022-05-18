//
//  TaskManagerView.swift
//  SwiftUI-Apprentic
//
//  Created by zzz on 2022/5/17.
//

import SwiftUI

struct TaskManagerView: View {
    
    @StateObject var taskManagerViewModel = TaskManagerViewModel()
    @Namespace var animation
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Welcom Back")
                        Text("Here's Update Today")
                            .font(.title2)
                            .bold()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding()
                    
                    CustomSegmentedBar()
                    
                    
                }
                .padding()
            }
            .navigationTitle("Task Manager")
            .overlay(alignment: .bottom) {
                Button {
                    taskManagerViewModel.openEditTask.toggle()
                } label: {
                    Label {
                        Text("Add Task")
                            .font(.callout)
                            .fontWeight(.semibold)
                    } icon: {
                        Image(systemName: "plus.app.fill")
                    }
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(.black, in: Capsule())
                }
                .background {
                    LinearGradient(colors: [
                        .white.opacity(0.05),
                        .white.opacity(0.4),
                        .white.opacity(0.7)
                    ], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                }
                // MARK
                .background(.red)
            }
            .fullScreenCover(isPresented: $taskManagerViewModel.openEditTask) {
                AddNewTaskView()
                    .environmentObject(taskManagerViewModel)
            }
        }
    }
    
    @ViewBuilder
    func CustomSegmentedBar() -> some View {
        let tabs = ["Today", "Upcoming", "Done"]
        HStack(spacing: 10) {
            ForEach(tabs, id: \.self) { tab in
                Text(tab)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .scaleEffect(0.9)
                    .foregroundColor(taskManagerViewModel.currentTab == tab ? .white : .black)
                    .padding(.vertical, 6)
                    .frame(maxWidth: .infinity)
                    .background {
                        if taskManagerViewModel.currentTab == tab {
                            Capsule()
                                .fill(.black)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                    .contentShape(Capsule())
                    .onTapGesture {
                        withAnimation{ taskManagerViewModel.currentTab = tab }
                    }
            }
        }
    }
}

struct TaskManagerView_Previews: PreviewProvider {
    static var previews: some View {
        TaskManagerView()
    }
}
