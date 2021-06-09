//
//  ViewController.swift
//  UnitTestDemoApp
//
//  Created by Dayal, Utkarsh on 03/06/21.
//

import UIKit

class SignupViewController: UIViewController, SignupViewDelegateProtocol {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    var signupPresenter: SignupPresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if signupPresenter == nil{
            signupPresenter = SignupPresenter(formModelValidator: SignUpFormModelValidator(), signupWebService: SignupWebService(urlString:Constants.signupURL), delegate: self)
        }
    }


    @IBAction func signupButtonPressed(_ sender: Any) {
        signupPresenter?.processUserSignup(formModel: SignupFormModel(firstName: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", email: emailTextField.text ?? "", phoneNumber: phoneNumberTextField.text ?? "", password: passwordTextField.text ?? "", repeatPassword: repeatPasswordTextField.text ?? ""))
    }
    
    func successfulSignup() {
        //Succesful Signup....Move to next Screen
    }
    
    func errorHandler(error: SignupError) {
        //Show Error
    }
    
}

