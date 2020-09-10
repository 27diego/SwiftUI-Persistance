//
//  ContentView.swift
//  TodoSwiftUI
//
//  Created by Developer on 9/8/20.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var todoManager = ToDoManager()
    
    @State var showAlert: Bool = false
    @State var textField: String = ""
    
    var body: some View {
        NavigationView{
            ZStack {
                List{
                    ForEach(todoManager.todos){ item in
                        Button(action: {
                            self.todoManager.checkItem(item: item)
                        }) {
                            if item.checked {
                                HStack{
                                    Text(item.todo)
                                    Spacer()
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 10))
                                        .foregroundColor(.blue)
                                }
                            }
                            else{
                                Text(item.todo)
                            }
                        }
                    }.onDelete { index in
                        index.forEach { self.todoManager.deleteItem(item: self.todoManager.todos[$0]) }
                    }
                }
                .navigationBarTitle("ToDo")
                .navigationBarItems(trailing: Button(action: {
                    self.showAlert = true
                }, label: {
                    Text("Add")
                }))
                
                if self.showAlert == true {
                    AlertControlView(textString: $textField, showAlert: $showAlert, title: "Add Todo", message: "").environmentObject(todoManager)
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




