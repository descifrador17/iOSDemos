//
//  ViewController.swift
//  Assignment1
//
//  Created by Dayal, Utkarsh on 29/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameView: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var addressField: UITextView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    @IBOutlet weak var nextButton: UIButton!
    
    var firstNameValue : String = ""
    var lastNameValue : String = ""
    var PhoneNumber : String = ""
    var addressValue : String = ""
    var emailValue : String = ""
    var datevalue : Date = Date()
    
    @IBAction func onNextClicked(_ sender: Any) {
        
        firstNameValue = firstNameView.text!
        lastNameValue = lastNameField.text!
        PhoneNumber = phoneNumberField.text!
        addressValue = addressField.text!
        emailValue = emailField.text!
        datevalue = dateField.date

        
        print(firstNameValue,validateName(firstNameValue))
        print(lastNameValue,validateName(lastNameValue))
        print(PhoneNumber,validateNumber(PhoneNumber))
        print(addressValue)
        print(emailValue,validateEmail(emailValue))
        print(datevalue)
        
        if(validateName(firstNameValue) == true &&
            validateName(lastNameValue) == true &&
            validateNumber(PhoneNumber) == true &&
            validateEmail(emailValue) == true &&
            !addressValue.isEmpty){
        
            let secondViewController = storyboard?.instantiateViewController(identifier: "second") as! SecondViewController
            
            //assigning variables of 2nd UIViewController
            secondViewController.firstNameValue = firstNameValue
            secondViewController.lastNameValue = lastNameValue
            secondViewController.PhoneNumber = PhoneNumber
            secondViewController.addressValue = addressValue
            secondViewController.emailValue = emailValue
            secondViewController.datevalue = datevalue
            
            secondViewController.modalPresentationStyle = .popover
            present(secondViewController,animated: true)
            
        }
        else{
            let alert = UIAlertController(title: "INCORRECT DATA", message: "Please check the filled data", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "CLOSE", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let borderColor: UIColor = UIColor(red:0.85,green:0.85,blue:0.85,alpha:1)
        addressField.layer.borderWidth = 0.5
        addressField.layer.borderColor = borderColor.cgColor
        addressField.layer.cornerRadius = 5
    }
    
    func validateName(_ name: String) -> Bool{
        let nameRegEx = "[A-Za-z]{1,}"
        let namePred = NSPredicate(format:"SELF MATCHES [c] %@", nameRegEx)
        return namePred.evaluate(with: name)
    }
    
    func validateNumber(_ number: String) -> Bool{
        let numberRegEx = "[0-9]{10}$"
        let numberPred = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        return numberPred.evaluate(with: number)
    }
    
    func validateEmail(_ email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }


}

