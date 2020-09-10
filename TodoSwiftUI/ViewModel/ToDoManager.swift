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
    @Published var items = [String](){
        didSet{
            UserDefaults.standard.set(items, forKey: "todolist")
        }
    }
    @Published var clickedItems = Set<String>()
    
    init() {
        let data = UserDefaults.standard.array(forKey: "todolist")
        items = data as! [String]
    }
    
    func addToList(toAdd: String){
        items.append(toAdd)
    }
    
    func itemInSet(item: String) -> Bool {
        return clickedItems.contains(item)
    }
    func removeFromSet(item: String){
        clickedItems.remove(item)
    }
    func addItemSet(item: String){
        clickedItems.insert(item)
    }
}

