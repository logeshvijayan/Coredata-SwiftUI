//
//  CoreStore.swift
//  ListApp
//
//  Created by logesh on 12/15/19.
//  Copyright © 2019 logesh. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

class CoreStore: ObservableObject {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @Published var todos: [Personal] = []
    
    init() { getTodos() }
    
    func getTodos() {
        let request = Personal.getAllTodosRequest()
        
        do {
            todos = try context.fetch(request)
        } catch {
            print("Error fetching the todos, \(error)")
        }
    }
    
    func addTodo(todoText: String) {
        if todoText != "" {
            let todo = Personal(context: context)
            todo.name = todoText
            saveContext()
        }
    }
    
    func deleteTodo(todoIndex: Int) {
        let deletedTodo = self.todos[todoIndex]
        context.delete(deletedTodo)
        saveContext()
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
                print("Success")
                getTodos()
            } catch {
                print("Error adding the todo, \(error)")
            }
        }
    }
}

