//
//  TodoItem.swift
//  TodoSwiftUI
//
//  Created by Developer on 9/9/20.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

struct TodoItem: Identifiable, Codable {
    let id: UUID = UUID()
    let phrase: String
}
