//
//  TealViewController.swift
//  NavigationControllerDemo
//
//  Created by Dayal, Utkarsh on 12/04/21.
//

import UIKit

class TealViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Teal Screen"
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PinkViewController{
            vc.username = usernameTextField.text!
        }
    }

}
