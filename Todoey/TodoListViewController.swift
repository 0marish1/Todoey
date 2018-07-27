//
//  ViewController.swift
//  Todoey
//
//  Created by Omar Abuelrish on 7/24/18.
//  Copyright © 2018 Omar Abuelrish. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    var itemArray = ["Find Milk", "Buy Eggos", "Destroy Demogorgon"]
    
    //interface for the users defauld database where you store key valuse pares
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //retreav data from where it is saved.
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
        
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
    
    
    
    ////////////////////////////////////////// Add Button ////////////////////////////////////////////////////
    
    
    //Mark - Add New Items
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        /// last step. making all the below accessable outside its brackets
        var textField = UITextField()
        
        
        // pop up or UIAlrert controller will show when add button pressed
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in

            // what will happen once the user clicks the add button on our UIAlert
            self.itemArray.append(textField.text!)
            
            //save updated item array to the user default
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            //////////////////// reload the screen to show new cell that user added to todo list/////////////////////
           self.tableView.reloadData()
            
        }
        
        //////////////////// adding a text field ///////////////////////////////////
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        // show alert
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
}









