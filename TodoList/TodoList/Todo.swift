//
//  Todo.swift
//  TodoList
//
//  Created by t2023-m0039 on 1/12/24.
//

import Foundation

struct Todo: Codable {
    var id: Int
    var title: String
    var isCompleted: Bool
}

var todoList: [Todo] = []
var itemKey = "item"
