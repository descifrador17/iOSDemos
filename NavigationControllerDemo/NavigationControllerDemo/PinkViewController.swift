//
//  PinkViewController.swift
//  NavigationControllerDemo
//
//  Created by Dayal, Utkarsh on 12/04/21.
//

import UIKit

class PinkViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    
    var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pink Screen"
        // Do any additional setup after loading the view.
        
        usernameLabel.text = username
    }
    

    

}
