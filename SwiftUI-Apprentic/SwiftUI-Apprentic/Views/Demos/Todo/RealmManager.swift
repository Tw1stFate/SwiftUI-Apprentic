//
//  RealmManager.swift
//  SwiftUI-Apprentic
//
//  Created by zzz on 2022/1/6.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private var localRealm: Realm?
    
    @Published private(set) var tasks = [Task]()
    
    init() {
        openRealm()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1) { migration, oldSchemaVersion in
                if oldSchemaVersion > 1 {
                    //
                }
            }
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
            getTasks()
        } catch {
            print("open realm failed")
        }
    }
    
    func addTask(title: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: ["title": title, "completed": false])
                    localRealm.add(newTask)
                    getTasks()
                    print("added new task")
                }
            } catch {
                print("add task failed: \(error)")
            }
        }
    }
    
    func getTasks() {
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    
    func updateTask(id: ObjectId, completed: Bool) {
        if let localRealm = localRealm {
            do {
                // 选用哪种更新方式
                // 1. 传入task, 更新taskid对应的数据(需要在调用前先更新task, 然后再通过id查出对应数据更新, 所以没必要在上层更新数据. 并且不应该在之前去更新task对象, 否则数据不是单向的, 可能存在task对象更新了, 而数据库操作失败, 导致数据不同步)
                // 2. 传入id和变更内容, 查到对应task进行更新, 更新完后通知刷新对应的数据
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else { return }
                
                try localRealm.write({
                    taskToUpdate.first?.completed = completed
                    getTasks()
                    print("update task \(id)")
                })
            } catch {
                print("updated \(id) failed: \(error)")
            }
        }
    }

    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToDelete.isEmpty else { return }
                
                try localRealm.write({
                    localRealm.delete(taskToDelete)
                    getTasks()
                    print("deleted task \(id)")
                })
            } catch {
                print("delete \(id) failed: \(error)")
            }
        }
    }
}
