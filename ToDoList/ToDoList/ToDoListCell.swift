//
//  ToDoListModel.swift
//  ToDoList
//
//  Created by Jamie Gaskin on 3/1/16.
//  Copyright © 2016 Jamie Gaskin. All rights reserved.
//

import UIKit

class ToDoListCell {
    var text: String
    var completed: Bool
    var timeCompleted: NSDate?
    
    init(text: String) {
        self.text = text
        self.completed = false
    }
}
