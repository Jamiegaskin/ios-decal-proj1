//
//  ViewController.swift
//  ToDoList
//
//  Created by Jamie Gaskin on 3/1/16.
//  Copyright © 2016 Jamie Gaskin. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var toDoItems = [ToDoListCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        toDoItems.append(ToDoListCell(text: "Finish Project"))
        toDoItems.append(ToDoListCell(text: "Beatles Arrangement"))
        toDoItems.append(ToDoListCell(text: "Clean Room"))
        toDoItems[0].completed = true
        toDoItems[0].timeCompleted = NSDate(timeIntervalSinceNow: -3700)
        
        toDoItems = toDoItems.filter({$0.timeCompleted?.timeIntervalSinceNow > -3600 || !$0.completed})
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToDoListTableViewController(segue: UIStoryboardSegue) {
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoTableViewCell
        let text = NSMutableAttributedString(string: toDoItems[indexPath.row].text)
        if toDoItems[indexPath.row].completed {
            text.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, text.length))
        }
        cell.ToDoItemTextLabel.attributedText = text
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GoToAdd" {
            let navVC = segue.destinationViewController as! UINavigationController
            let destinationVC = navVC.topViewController as! AddToDoItemViewController
            destinationVC.parent = self
        } else if segue.identifier == "GoToStats" {
            let destinationVC = segue.destinationViewController as! StatsViewController
            var count = 0
            for item in toDoItems {
                if item.timeCompleted?.timeIntervalSinceNow > -3600 && item.completed {
                    count++
                }
            }
            destinationVC.number = count
        }
        
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            toDoItems.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        toDoItems[indexPath.row].completed = !toDoItems[indexPath.row].completed
        toDoItems[indexPath.row].timeCompleted = NSDate()
        self.tableView.reloadData()
    }
}

