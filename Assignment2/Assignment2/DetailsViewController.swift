//
//  DetailsViewController.swift
//  Assignment2
//
//  Created by Dayal, Utkarsh on 05/04/21.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    
    var firstNameValue : String = ""
    var lastNameValue : String = ""
    var PhoneNumber : String = ""
    var addressValue : String = ""
    var emailValue : String = ""
    var datevalue : Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameLabel.text = firstNameValue
        lastNameLabel.text = lastNameValue
        phoneLabel.text = PhoneNumber
        addressLabel.text = addressValue
        emailLabel.text = emailValue
        dobLabel.text = datevalue.description.lowercased()
    }

}
