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
                List(todoManager.items){ item in
                    Button(action: {
                        if self.todoManager.itemInSet(item: item.id){
                            self.todoManager.removeFromSet(item: item.id)
                        }
                        else {
                            self.todoManager.addItemSet(item: item.id)
                        }
                    }) {
                        if self.todoManager.itemInSet(item: item.id) {
                            HStack{
                                Text(item.phrase)
                                Spacer()
                                Image(systemName: "checkmark")
                                    .foregroundColor(.black)
                            }
                        }
                        else{
                            Text(item.phrase)
                        }
                    }
                }
                .navigationBarTitle("ToDo")
                .navigationBarItems(trailing: Button(action: {
                    self.showAlert = true
                }, label: {
                    Text("Add")
                }))
                
                if self.showAlert == true {
                    AlertControlView(textString: $textField, showAlert: $showAlert, items: $todoManager.items, title: "Add Item", message: "")
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




