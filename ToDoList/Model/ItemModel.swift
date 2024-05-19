//
//  ItemModel.swift
//  ToDoList
//
//  Created by doniyor normuxammedov on 18/05/24.
//

import Foundation

// Immutabel Struct

struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isCompleted:Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
