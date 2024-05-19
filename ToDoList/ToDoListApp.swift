//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by doniyor normuxammedov on 17/05/24.
//

import SwiftUI

/*
 MVVM - Model-View-ViewModel
 Model = Data point
 View = UI
 ViewModel =
 */
@main
 struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
            ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle() )
            .environmentObject(listViewModel)
        }
    }
}
