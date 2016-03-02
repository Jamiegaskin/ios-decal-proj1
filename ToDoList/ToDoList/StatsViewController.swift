//
//  StatsViewController.swift
//  ToDoList
//
//  Created by Jamie Gaskin on 3/1/16.
//  Copyright © 2016 Jamie Gaskin. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    var number : Int = 0
    
    @IBOutlet weak var numLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        numLabel.text = "\(number)"
    }
}
