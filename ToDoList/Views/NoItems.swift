//
//  NoItems.swift
//  ToDoList
//
//  Created by doniyor normuxammedov on 19/05/24.
//

import SwiftUI

struct NoItems: View {
    @State var animate: Bool = false
    let secondColor: Color = Color("SecondColor")
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of itemsto your todo list!")
                    .padding(.bottom,20)
               NavigationLink(
                destination: AddView(),
                label: {
                    Text("Add Something")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondColor : Color.accentColor)
                        .cornerRadius(10)
                })
               .padding(.horizontal,animate ? 30 : 50)
               .shadow(
                color: animate ? secondColor.opacity(0.7) :
                    Color.accentColor.opacity(0.7),
                radius: animate ? 30 : 10,
                x: 0,
                y: animate ? 50 : 30 )
               .scaleEffect(animate ? 1.1 : 1.0)
               .offset(y: animate ? -7 : 0)
               
                
                   
            }
            .frame(maxWidth: 400 )
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: animation)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
    func animation(){
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
            Animation
                .easeInOut(duration: 1.5)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}

#Preview {
    NavigationView {
        NoItems()
            .navigationTitle("Title")

    }
}
