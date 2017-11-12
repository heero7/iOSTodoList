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
    }
    
    private func setup() {
        titleLabel.text = selectedTodo.name
    }
}
