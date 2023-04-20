//
//  DetailsViewController.swift
//  Assignment_Notebook
//
//  Created by Amanda Reyes on 4/20/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var details: UILabel!
    var name = ""
    var describe = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        title.text = name
        details.text = describe
    }

}
