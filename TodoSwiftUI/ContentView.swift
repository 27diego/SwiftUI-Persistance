//
//  ContentView.swift
//  TodoSwiftUI
//
//  Created by Developer on 9/8/20.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var items = [
        Characters(phrase: "Find Mike"),
        Characters(phrase: "Buy Eggos"),
        Characters(phrase: "Destroy Demogorgon")
    ]
    
    @State var clickedItems:Set<UUID> = []
    @State var showAlert: Bool = false
    @State var textField: String = ""
    
    
    var body: some View {
        NavigationView{
            ZStack {
                List(items){ item in
                    Button(action: {
                        if self.clickedItems.contains(item.id){
                            self.clickedItems.remove(item.id)
                        }
                        else {
                            self.clickedItems.insert(item.id)
                        }
                    }) {
                        if self.clickedItems.contains(item.id) {
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
                    AlertControlView(textString: $textField, showAlert: $showAlert, items: $items, title: "Add Item", message: "")
                }
                
            }
        }
    }
    
    func addItem(toAdd: String){
        items.append(Characters(phrase: toAdd))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Characters: Identifiable {
    let id: UUID = UUID()
    let phrase: String
}

