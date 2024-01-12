//
//  todoData.swift
//  TodoList
//
//  Created by t2023-m0039 on 1/12/24.
//

import Foundation



func addTodoList(todo: Todo) {
    
    todoList.append(todo)
    

    guard let encodedData = try? JSONEncoder().encode(todoList) else { return }
    print("\(todoList)")
    UserDefaults.standard.set(encodedData, forKey: itemKey)
}

func readTodoList() -> [Todo] {
    guard let todoListData = UserDefaults.standard.data(forKey: itemKey),
          let decodedData = try? JSONDecoder().decode([Todo].self, from: todoListData)
    else{ return [] }
    
    todoList = decodedData
    
    return decodedData
}


func deleteTodo(todoId: Int) {
    
    todoList.removeAll { todo in
        todo.id == todoId
    }
    
    guard let data = try? JSONEncoder().encode(todoList) else { return }
    
    UserDefaults.standard.setValue(data, forKey: itemKey)
}
