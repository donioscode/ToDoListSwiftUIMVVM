//
//  ListView.swift
//  ToDoList
//
//  Created by doniyor normuxammedov on 17/05/24.
//

import SwiftUI

struct ListView: View {
    // call teh listviewModel enivromentObject 
    @EnvironmentObject var listViewModel: ListViewModel
   
    
    var body: some View {
        
        ZStack {
            if listViewModel.items.isEmpty {
                NoItems()
                    .transition(AnyTransition.opacity
                        .animation(.easeIn))
            } else {
                List{
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                        //tapped the list item and changed the look
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
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
    .environmentObject(ListViewModel())
   
}


