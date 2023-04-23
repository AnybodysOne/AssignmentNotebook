//
//  DetailsViewController.swift
//  Assignment_Notebook
//
//  Created by Amanda Reyes on 4/20/23.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet var titlee: UILabel!
    @IBOutlet var details: UILabel!
    var name = ""
    var describe = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titlee.text = name
        details.text = describe
    }

}
