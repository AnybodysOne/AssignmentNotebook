//
//  ViewController.swift
//  Assignment_Notebook
//
//  Created by Amanda Reyes on 4/18/23.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    @IBOutlet weak var assignmentTable: UITableView!
    var task1 = Task(name:"Wash Dishes", details: "Don't forget to dry them")
    var task2 = Task(name : "Clean Desk", details : "Put the books away")
    var assignments : [Task] = [task1, task2]
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
        content.text = assignments[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
    
    @IBAction func whenAdded(_ sender: Any) {
        let alert = UIAlertController(title: "Add Task", message: "Add your task below", preferredStyle: .alert)
        alert.addTextField()
        alert.addTextField()
        func insert(){
            if alert.textFields?[0].text! != "" {
                let task = (alert.textFields?[0].text)!
                let describe = (alert.textFields?[1].text)
                var newTask = Task(name: task, details: describe ?? "")
                self.assignments.append(newTask)
                self.assignmentTable.reloadData()
            } else {
                return
            }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var segue = UIStoryboardSegue(identifier: "Segue", source: ViewController(), destination: DetailsViewController())
        prepare(for: segue, sender: self)
        if segue.identifier == "Segue"{
            guard let nvc = segue.destination as? DetailsViewController else {return}
            nvc.name = assignments[indexPath.row].name
            nvc.describe = assignments[indexPath.row].details
            performSegue(withIdentifier: "Segue", sender: self)
        }
    }

}

