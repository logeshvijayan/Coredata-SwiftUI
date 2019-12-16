//
//  ContentView.swift
//  ListApp
//
//  Created by logesh on 12/15/19.
//  Copyright © 2019 logesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var core = CoreStore()
    @State private var newListItem = ""
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Add Name")){
                HStack{
                TextField("New item", text: self.$newListItem)
                Button(action:
                {
                    if self.newListItem != " "
                    {
                        self.core.addTodo(todoText: self.newListItem)
                        self.newListItem = " "
                    }
                    
                })
                { Image(systemName: "plus.circle.fill") }
                .foregroundColor(.green)
                .imageScale(.large)
                }
                }
                Section(header: Text("List Of Names")){
                    ForEach(self.core.todos, id: \.self) { todo in
                                        TableCell(todo: todo)
                        }
                    .onDelete { indexSet in
                                        self.core.deleteTodo(todoIndex: indexSet.first!)
                                    }
                .onTapGesture(perform: edit)
                }
                
                }
          .navigationBarTitle(Text("My List"), displayMode: .inline)
          .edgesIgnoringSafeArea(.bottom)
        }
    }
    func edit()
    {
        print("edit")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
