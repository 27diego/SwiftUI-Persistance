//
//  TodoItem.swift
//  TodoSwiftUI
//
//  Created by Developer on 9/9/20.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

struct Todos: Codable {
    var todos: [TodoItem] = [TodoItem]()
    
    struct TodoItem: Identifiable, Codable {
        let id: UUID = UUID()
        let todo: String
        var checked: Bool = false
    }
    
    // failable initializer
    init?(json: Data?){
        if json != nil, let newDocument = try? JSONDecoder().decode(Todos.self, from: json!){
            self = newDocument
        } else {
            return nil
        }
    }
    
    init() {}
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    mutating func addtodo(todo: String){
        todos.append(TodoItem(todo: todo))
    }
    
    mutating func checkItem(item: TodoItem){
        if let index = todos.indexForItem(item: item){
            todos[index].checked = todos[index].checked ? false : true
        }
    }
    
    mutating func deleteItemFromList(item: UUID){
        for i in 0...todos.count {
            if todos[i].id == item{
                todos.remove(at: i)
                break
            }
        }
    }
}


