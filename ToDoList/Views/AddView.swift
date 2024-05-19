//
//  AddView.swift
//  ToDoList
//
//  Created by doniyor normuxammedov on 17/05/24.
//

import SwiftUI

struct AddView: View {
    // segue added
    @Environment(\.presentationMode) var presentationMode
    //connect view to listviewmodel
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type to somthing here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(#colorLiteral(red: 0.8274509907, green: 0.8274510503, blue: 0.8274509907, alpha: 1)))
                    .cornerRadius(10)
                Button(action: saveButtonPressed, label: {
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
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed(){
        if textIsApproprite(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        // else statement here pinned
    }
    
    func textIsApproprite() -> Bool {
        if  textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!! 😨😰😱"
            showAlert.toggle()
            return false
        }
       return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
 
}
