//
//  ItemModel.swift
//  ToDoList
//
//  Created by doniyor normuxammedov on 18/05/24.
//

import Foundation
struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted:Bool
}
