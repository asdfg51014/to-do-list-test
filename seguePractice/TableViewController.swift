//
//  TableViewController.swift
//  seguePractice
//
//  Created by Albert on 2018/8/15.
//  Copyright © 2018 Albert.C. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var information: [Information] = []
    var rowOfNumber = 0
    
    
    @IBOutlet var emptyView: UIView!
    
    @IBOutlet var editButton: UIBarButtonItem! {
        didSet {
            editButton.title = "Edit"
        }
    }
    
    @IBAction func close(segue: UIStoryboardSegue) {
    }
    
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func editBack(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func edit(_ sender: UIBarButtonItem) {
        self.tableView.isEditing = !self.tableView.isEditing
        
        switch self.tableView.isEditing {
        case true:
            editButton.title = "Done"
        case false:
            editButton.title = "Edit"
        
        }
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        tableView.isEditing = false
        if segue.identifier == "editSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let editVC = segue.destination as! editViewController
                editVC.information = information[indexPath.row]
                editVC.row = indexPath.row
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = emptyView
        tableView.backgroundView?.isHidden = true
//        self.tableView.isEditing = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
        if information.count >= 1 {
            self.tableView.scrollToRow(at: [0,information.count - 1], at: .bottom, animated: true)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if information.count > 0 {
            tableView.backgroundView?.isHidden = true
            tableView.separatorStyle = .singleLine
        } else {
            tableView.backgroundView?.isHidden = false
            tableView.separatorStyle = .none
        }
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return information.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.textLabel?.text = information[indexPath.row].title
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        print("aaa")
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            self.information.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(false)
        }
        let mySwipeAction = UISwipeActionsConfiguration(actions: [deleteAction])
        return mySwipeAction
    }
    
    
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//
//
//    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
        
    }

    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let move = self.information[rowOfNumber]
        information.remove(at: sourceIndexPath.row)
        information.insert(move, at: destinationIndexPath.row)
    }

}
