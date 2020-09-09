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
    @Published var items = [TodoItem]()
    @Published var clickedItems = Set<UUID>()
    
    init() {
        items.append(TodoItem(phrase: "Find Mike"))
        items.append(TodoItem(phrase: "Buy Eggos"))
        items.append(TodoItem(phrase: "Destroy Demogorgon"))
    }
    
    func addToList(toAdd: String){
        items.append(TodoItem(phrase: toAdd))
    }
    
    func itemInSet(item: UUID) -> Bool {
        return clickedItems.contains(item)
    }
    func removeFromSet(item: UUID){
        clickedItems.remove(item)
    }
    func addItemSet(item:UUID){
        clickedItems.insert(item)
    }
}
