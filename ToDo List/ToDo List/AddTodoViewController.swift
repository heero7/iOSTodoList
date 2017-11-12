//
//  AddTodoViewController.swift
//  ToDo List
//
//  Created by Kevin Mudiandambo on 11/8/17.
//  Copyright © 2017 Kevin Mudiandambo. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {
    
    //reference to the previous view controller
    var previousViewController = TodoTableViewController()

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importanceSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
     Adds an item to the main todo list array
     */
    @IBAction func addToDoItem(_ sender: Any) {
//        let todo = ToDo()
//        if let text = titleTextField.text {
//            todo.name = text
//
//            todo.important = importanceSwitch.isOn
//
//            // add to the array
//            previousViewController.todoList.append(todo)
//
//            reloadDataInViewController()
//            moveBackToMainView()
//        }
//        // else do nothing
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let todo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
            
            if let text = titleTextField.text {
                todo.name = text
                todo.important = importanceSwitch.isOn
            }
            try? context.save()
            navigationController?.popViewController(animated: true)
        }
    }
    
    /*
     Reload the data in the ViewController so
     we gat the most current to do data.
     */
    private func reloadDataInViewController(){
        previousViewController.tableView.reloadData()
    }
    
    /*
     Moves back to the main view
     */
    private func moveBackToMainView(){
        navigationController?.popViewController(animated: true)
    }
}
