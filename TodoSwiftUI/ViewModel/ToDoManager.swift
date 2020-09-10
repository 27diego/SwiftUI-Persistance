//
//  ToDoManager.swift
//  TodoSwiftUI
//
//  Created by Developer on 9/9/20.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation
import SwiftUI

class ToDoManager: ObservableObject {
    var todoModel: Todos {
        willSet{
            objectWillChange.send()
        }
        didSet{
            UserDefaults.standard.set(todoModel.json, forKey: "todoModel")
        }
    }
    
    var todos: [Todos.TodoItem] { todoModel.todos }
    
    init() {
        todoModel = Todos.init(json: UserDefaults.standard.data(forKey: "todoModel")) ?? Todos()
    }
    
    func addToList(toAdd: String){
        todoModel.addtodo(todo: toAdd)
    }
    
    func checkItem(item: Todos.TodoItem){
        todoModel.checkItem(item: item)
    }
    
    func deleteItem(item: Todos.TodoItem){
        todoModel.deleteItemFromList(item: item.id)
    }
}

