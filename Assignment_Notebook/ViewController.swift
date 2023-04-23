//
//  ViewController.swift
//  Assignment_Notebook
//
//  Created by Amanda Reyes on 4/18/23.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    @IBOutlet weak var assignmentTable: UITableView!
    var assignments : [Task] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        assignmentTable.dataSource = self
        assignmentTable.delegate = self
        let alert = UIAlertController(title: "Add a task to begin", message: "Click the '+' in the top right corner", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(ok)
        present(alert, animated: true)
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
        alert.textFields?[0].placeholder = "Task name here..."
        alert.textFields?[1].placeholder = "Task details here..."
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
        let cell = indexPath.row
        self.performSegue(withIdentifier: "Segue", sender: cell)
//        if let nvc = segue.destination as? DetailsViewController {
//            print("success")
//            nvc.name = assignments[indexPath.row].name
//            nvc.describe = assignments[indexPath.row].details
//            performSegue(withIdentifier: "Segue", sender: self)
//        }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue"{
            print("success")
            var row = assignmentTable.indexPathForSelectedRow
            let nvc = segue.destination as! DetailsViewController
            nvc.name = assignments[row?.row ?? 0].name
            nvc.describe = assignments[row?.row ?? 0].details
        }
    }
    
}


