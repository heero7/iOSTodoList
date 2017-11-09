//
//  TodoTableViewController.swift
//  ToDo List
//
//  Created by Kevin Mudiandambo on 11/8/17.
//  Copyright © 2017 Kevin Mudiandambo. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {

    var todoList : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        todoList = createTestTodos()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let todo = todoList[indexPath.row]  //whatever index/cell number we're looking at, get that                   //  todo item
        
        if todo.important {
            cell.textLabel?.text = "❗" + todo.name
        } else {
            cell.textLabel?.text = todo.name
        }
        
        return cell
    }
    
    //MARK: Testing vars and functions
    
    /*
     Creates a dummy list of todo items
     for testing purposes
     */
    func createTestTodos() -> [ToDo] {
        let eggs = ToDo()
        eggs.name = "Buy eggs"
        eggs.important = true
        
        let fruit = ToDo()
        fruit.name = "Get apples, strawberries, and grapes"
        fruit.important = true
        
        let napkins = ToDo()
        napkins.name = "Get napkins for kitchen table"
        napkins.important = false
        
        return [eggs, fruit, napkins]
    }
}
