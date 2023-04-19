//
//  ViewController.swift
//  Assignment_Notebook
//
//  Created by Amanda Reyes on 4/18/23.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    var assignments : [String] = ["Fix App"]
    @IBOutlet weak var assignmentTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        assignmentTable.dataSource = self
        assignmentTable.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = assignmentTable.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = assignments[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    @IBAction func whenAdded(_ sender: Any) {
        let alert = UIAlertController(title: "Add Task", message: "Add your task below", preferredStyle: .alert)
        alert.addTextField()
        func insert(){
            var task = (alert.textFields?[0].text)!
            self.assignments.append("\(task)")
            self.assignmentTable.reloadData()
        }
        let add = UIAlertAction(title: "Add", style: .default, handler: {action in
            insert()
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(add)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            assignments.remove(at: indexPath.row)
            assignmentTable.reloadData()
        }
    }

}

