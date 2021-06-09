//
//  ViewController.swift
//  Assignment2
//
//  Created by Dayal, Utkarsh on 31/03/21.
//

import UIKit

class SignupViewController: UIViewController {
        
    var signupPresenter: SignupPresenterProtocol?
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint:NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var heightKeyboard:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.signupPresenter == nil{
            signupPresenter = FormPresenter(formModelValidator: FormModelValidator(), delegate: self)
        }
     
        setupUITextFieldDelegates()
    }
    
    @IBAction func onSaveClicked(_ sender: UIButton) {
        
        signupPresenter?.processSignup(formModel: FormModel(firstName: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", phoneNumber: phoneNumberTextField.text ?? "", address: addressTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "", repeatPassword: repeatPasswordTextField.text ?? ""))

    }
    
}

//MARK: - Signup Response
extension SignupViewController: SignupViewDelegateProtocol{
    func successfulSignup() {
        let detailsVC = storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        
        //assigning variables of 2nd UIViewController
        detailsVC.firstNameValue = firstNameTextField.text!
        detailsVC.lastNameValue = lastNameTextField.text!
        detailsVC.PhoneNumber = phoneNumberTextField.text!
        detailsVC.addressValue = addressTextField.text!
        detailsVC.emailValue = emailTextField.text!
        
        detailsVC.modalPresentationStyle = .popover
        present(detailsVC,animated: true)
    }
    
    func errorHandler(error: FormErrors) {
        let alert = UIAlertController(title: "INCORRECT DATA", message: "Please check the filled data", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "CLOSE", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

//MARK: - UITextField Delagates
extension SignupViewController: UITextFieldDelegate{
    
    func setupUITextFieldDelegates(){
        self.firstNameTextField.delegate = self
        self.lastNameTextField.delegate = self
        self.phoneNumberTextField.delegate = self
        self.addressTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.repeatPasswordTextField.delegate = self

        firstNameTextField.addToolbarToKeyboard(field: firstNameTextField)
        lastNameTextField.addToolbarToKeyboard(field: lastNameTextField)
        phoneNumberTextField.addToolbarToKeyboard(field: phoneNumberTextField)
        addressTextField.addToolbarToKeyboard(field: addressTextField)
        emailTextField.addToolbarToKeyboard(field: emailTextField)
        passwordTextField.addToolbarToKeyboard(field: passwordTextField)
        repeatPasswordTextField.addToolbarToKeyboard(field: repeatPasswordTextField)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
}

//MARK: - Keyboard Operations
extension SignupViewController{
    
    @objc func keyboardWillShow(notification:NSNotification){
        if let info = notification.userInfo{
            let rect:CGRect = info["UIKeyboardFrameEndUserInfoKey"] as! CGRect
            self.scrollView.contentSize = CGSize(width: self.scrollView.frame.width, height: self.scrollView.frame.height+rect.height)
            if((addressTextField.frame.maxY>rect.minY && addressTextField.isEditing) || (emailTextField.isEditing && emailTextField.frame.maxY>rect.minY)){
                heightKeyboard = rect.height
                self.scrollView.setContentOffset(CGPoint(x: 0, y:rect.height), animated: true)
            }
        }
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        phoneNumberTextField.resignFirstResponder()
        addressTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repeatPasswordTextField.resignFirstResponder()

        UIView.animate(withDuration: 0.5, animations: {
            self.scrollView.setContentOffset(CGPoint(x: 0, y:0), animated: true)
        })
    }
    
}
