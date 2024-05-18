//
//  ListRowView.swift
//  ToDoList
//
//  Created by doniyor normuxammedov on 17/05/24.
//

import SwiftUI

struct ListRowView: View {
   let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle": "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}
var item1 = ItemModel(title: "First", isCompleted: false)
var item2 = ItemModel(title: "Second", isCompleted: true)

#Preview {
    Group {
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
    .previewLayout(.sizeThatFits)
    
}
