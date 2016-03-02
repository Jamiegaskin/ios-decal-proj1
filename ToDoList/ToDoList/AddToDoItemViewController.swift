//
//  AddToDoItemViewController.swift
//  ToDoList
//
//  Created by Jamie Gaskin on 3/1/16.
//  Copyright © 2016 Jamie Gaskin. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController {
    var parent: ToDoListTableViewController?
    @IBOutlet weak var userIn: UITextField!
    
    @IBAction func submit(sender: AnyObject) {
        if let text = userIn.text {
            parent?.toDoItems.append(ToDoListCell(text: text))
        }
        performSegueWithIdentifier("exitAddNewToDo", sender: self)
        parent?.tableView.reloadData()
    }
}
