//
//  ListView.swift
//  ToDoList
//
//  Created by doniyor normuxammedov on 17/05/24.
//

import SwiftUI

struct ListView: View {
    @State var items:[ItemModel] = [
    ItemModel(title: "This is the first title!", isCompleted: false),
    ItemModel(title: "This is the second!", isCompleted: true),
    ItemModel(title: "Third!", isCompleted: true),
    ]
    
    var body: some View {
        List{
            ForEach(items) { item in
                ListRowView(item: item)
            }
            
        }
        .listStyle(PlainListStyle())
        .navigationTitle("ToDo Lsit📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView()))
        
    }
}

#Preview {
    NavigationView {
        ListView()
    }
   
}


