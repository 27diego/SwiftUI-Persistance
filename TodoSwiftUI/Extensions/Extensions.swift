//
//  Extensions.swift
//  TodoSwiftUI
//
//  Created by Developer on 9/10/20.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

extension Array where Element == Todos.TodoItem {
    func indexForItem(item: Element) -> Int? {
        for i in 0...self.count {
            if self[i].id == item.id{
                return i
            }
        }
        return nil
    }
}
