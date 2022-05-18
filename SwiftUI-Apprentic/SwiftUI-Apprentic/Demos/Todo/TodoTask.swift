//
//  Task.swift
//  SwiftUI-Apprentic
//
//  Created by zzz on 2022/1/7.
//

import Foundation
import RealmSwift

class TodoTask: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
