//
//  SecondViewController.swift
//  Assignment1
//
//  Created by Dayal, Utkarsh on 29/03/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    var firstNameValue : String = ""
    var lastNameValue : String = ""
    var PhoneNumber : String = ""
    var addressValue : String = ""
    var emailValue : String = ""
    var datevalue : Date = Date()

    @IBOutlet weak var firstNameField: UILabel!
    @IBOutlet weak var lastNameField: UILabel!
    @IBOutlet weak var phoneNumberField: UILabel!
    @IBOutlet weak var addressField: UILabel!
    @IBOutlet weak var emailField: UILabel!
    @IBOutlet weak var dobField: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstNameField.text = firstNameValue
        lastNameField.text = lastNameValue
        phoneNumberField.text = PhoneNumber
        addressField.text = addressValue
        emailField.text = emailValue
        print(datevalue)
        let tempdate = DateFormatter().string(from: datevalue)
        print(tempdate)
        dobField.text = tempdate
    }


}
