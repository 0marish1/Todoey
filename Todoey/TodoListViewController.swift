//
//  ViewController.swift
//  Todoey
//
//  Created by Omar Abuelrish on 7/24/18.
//  Copyright © 2018 Omar Abuelrish. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    let itemArray = ["Find Milk", "Buy Eggos", "Destroy Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Allows us to specify what the cells should desplay
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    // how many rows we want in our table view?
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
  
    
    
    ///////////////////////////////////////// Checking and unchecking the cell ////////////////////////////////////////
    
    
    
    
    //being able to tell where the user clicked
    // being able to check and uncheck when you click on the cell
    
    // 2 tableView Deligate Methods
    // #1 being able to tell where the user picked, what array number and then print it
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
        //print(itemArray[indexPath.row])
        
        // giving the cell that was selected a check mark (Accessory)
       // (wrote this before the line 56-60 tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        // removing the check mark if selected again
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
    } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        // The dim light that comes on when you tap on one of the options. 
        tableView.deselectRow(at: indexPath, animated: true)
        
    
        
    }
}









