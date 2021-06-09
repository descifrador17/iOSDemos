//
//  ViewController.swift
//  Assignment2
//
//  Created by Dayal, Utkarsh on 31/03/21.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
        
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var dobPicker: UIDatePicker!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var firstNameValue : String = ""
    var lastNameValue : String = ""
    var PhoneNumber : String = ""
    var addressValue : String = ""
    var emailValue : String = ""
    var datevalue : Date = Date()
    
    var heightKeyboard:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstNameField.delegate = self
        self.lastNameField.delegate = self
        self.phoneField.delegate = self
        self.addressField.delegate = self
        self.emailField.delegate = self
        
        firstNameField.addToolbarToKeyboard(field: firstNameField)
        lastNameField.addToolbarToKeyboard(field: lastNameField)
        phoneField.addToolbarToKeyboard(field: phoneField)
        addressField.addToolbarToKeyboard(field: addressField)
        emailField.addToolbarToKeyboard(field: emailField)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint:NSLayoutConstraint!
    
    @IBAction func onSaveClicked(_ sender: UIButton) {
        
        firstNameValue = firstNameField.text!
        lastNameValue = lastNameField.text!
        PhoneNumber = phoneField.text!
        addressValue = addressField.text!
        emailValue = emailField.text!
        datevalue = dobPicker.date
        
        if(validateName(firstNameValue) == true &&
            validateName(lastNameValue) == true &&
            validateNumber(PhoneNumber) == true &&
            validateEmail(emailValue) == true &&
            !addressValue.isEmpty){
            
            let detailsVC = storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
            
            //assigning variables of 2nd UIViewController
            detailsVC.firstNameValue = firstNameValue
            detailsVC.lastNameValue = lastNameValue
            detailsVC.PhoneNumber = PhoneNumber
            detailsVC.addressValue = addressValue
            detailsVC.emailValue = emailValue
            detailsVC.datevalue = datevalue
            
            detailsVC.modalPresentationStyle = .popover
            present(detailsVC,animated: true)
            
        }
        else{
            let alert = UIAlertController(title: "INCORRECT DATA", message: "Please check the filled data", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "CLOSE", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func keyboardWillShow(notification:NSNotification){
        if let info = notification.userInfo{
            let rect:CGRect = info["UIKeyboardFrameEndUserInfoKey"] as! CGRect
            self.scrollView.contentSize = CGSize(width: self.scrollView.frame.width, height: self.scrollView.frame.height+rect.height)
            if((addressField.frame.maxY>rect.minY && addressField.isEditing) || (emailField.isEditing && emailField.frame.maxY>rect.minY)){
                heightKeyboard = rect.height
                self.scrollView.setContentOffset(CGPoint(x: 0, y:rect.height), animated: true)
            }
        }
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        phoneField.resignFirstResponder()
        addressField.resignFirstResponder()
        emailField.resignFirstResponder()
        dobPicker.resignFirstResponder()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.scrollView.setContentOffset(CGPoint(x: 0, y:0), animated: true)
        })
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        UIView.animate(withDuration: 0.5, animations: {
            self.scrollView.setContentOffset(CGPoint(x: 0, y:0), animated: true)
        })
        return true
    }
    
    
}
