//
//  TodoTableViewController.swift
//  ToDo List
//
//  Created by Kevin Mudiandambo on 11/8/17.
//  Copyright © 2017 Kevin Mudiandambo. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {

    var todoList : [ToDoCoreData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /*
     Function is called right before the view will appear
     to reload necessary data
     */
    override func viewWillAppear(_ animated: Bool) {
        getToDoItemsFromCoreData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let todo = todoList[indexPath.row]  //whatever index/cell number we're looking at, get that                   //  todo item
        if let name = todo.name {
        
            if todo.important {
                cell.textLabel?.text = "❗" + name
            } else {
                cell.textLabel?.text = todo.name
            }
            
        }
        
        return cell
    }
    
    /*
     When you want to know when a particular cell has been tapped.
     Use this function
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todoList[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: todo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //send the reference to the view controller
        if let addViewController = segue.destination as? AddTodoViewController {
            addViewController.previousViewController = self
        }
        
        if let todoCompleteViewController = segue.destination as? TodoCompleteViewController {
            if let todo = sender as? ToDoCoreData {
                todoCompleteViewController.previousVC = self
                todoCompleteViewController.selectedTodo = todo
            }
        }
    }
    
    /*
     Load the data from core data
     */
    private func getToDoItemsFromCoreData() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataTodo = try? context.fetch(ToDoCoreData.fetchRequest()) as? [ToDoCoreData] {
                if let theTodoItems = coreDataTodo {
                    todoList = theTodoItems
                    tableView.reloadData()
                }
            }
        }
    }
}
