//
//  AddView.swift
//  ToDoList
//
//  Created by doniyor normuxammedov on 17/05/24.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText: String = ""
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type to somthing here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(#colorLiteral(red: 0.8274509907, green: 0.8274510503, blue: 0.8274509907, alpha: 1)))
                    .cornerRadius(10)
                Button(action: {
                    
                }, label: {
                    Text("save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                
            }
            .padding(14)
        }
        
        .navigationTitle("Add an Item🖊️")
    }
}

#Preview {
    NavigationView {
        AddView()
    }
 
}
