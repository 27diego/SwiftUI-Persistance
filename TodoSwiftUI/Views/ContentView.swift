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
                List(todoManager.items, id: \.self){ item in
                    Button(action: {
                        if self.todoManager.itemInSet(item: item){
                            self.todoManager.removeFromSet(item: item)
                        }
                        else {
                            self.todoManager.addItemSet(item: item)
                        }
                    }) {
                        if self.todoManager.itemInSet(item: item) {
                            HStack{
                                Text(item)
                                Spacer()
                                Image(systemName: "checkmark")
                                    .foregroundColor(.black)
                            }
                        }
                        else{
                            Text(item)
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




