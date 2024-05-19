//
//  ListViewModel.swift
//  ToDoList
//
//  Created by doniyor normuxammedov on 18/05/24.
//

import Foundation

class ListViewModel: ObservableObject {
    // connect the viewmodel to Model
    @Published var items: [ItemModel] = [] {
        // didSet do delete,move,add,update items and save data
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems(){
//        let newItems = [
//            ItemModel(title: "This is the first title!", isCompleted: false),
//            ItemModel(title: "This is the second!", isCompleted: true),
//            ItemModel(title: "Third!", isCompleted: false),
//        ]
//        items.append(contentsOf: newItems)
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItms = try? JSONDecoder().decode([ItemModel].self,from: data)
              else { return }
        
        self.items = savedItms
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(indices:IndexSet,newOffset: Int){
        items.move(fromOffsets: indices, toOffset: newOffset)
    }
    func addItem(title:String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item: ItemModel) {
//        if let index = items.firstIndex(where: { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        }{
//            // run this code
//        }
//        
        
        
        //create new item id not new item
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    
    // save data JSON type use userdefaults
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
