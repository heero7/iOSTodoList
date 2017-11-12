//
//  TodoCompleteViewController.swift
//  ToDo List
//
//  Created by Kevin Mudiandambo on 11/11/17.
//  Copyright © 2017 Kevin Mudiandambo. All rights reserved.
//

import UIKit

class TodoCompleteViewController: UIViewController {

    var previousVC = TodoTableViewController()
    var selectedTodo = ToDo()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    @IBAction func completeTodo(_ sender: Any) {
        var index = 0
        for todo in previousVC.todoList {
            if todo.name == selectedTodo.name {
                previousVC.todoList.remove(at: index)
                reloadDataInViewController()
                moveBackToMainView()
                break
            }
           index += 1
        }
    }
    
    private func setup() {
        titleLabel.text = selectedTodo.name
    }
    
    /*
     Reload the data in the ViewController so
     we gat the most current to do data.
     */
    private func reloadDataInViewController(){
        previousVC.tableView.reloadData()
    }
    
    /*
     Moves back to the main view
     */
    private func moveBackToMainView(){
        navigationController?.popViewController(animated: true)
    }
}
