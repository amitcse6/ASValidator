//
//  ViewController.swift
//  ASValidator
//
//  Created by amitpstu1@gmail.com on 06/29/2020.
//  Copyright (c) 2020 amitpstu1@gmail.com. All rights reserved.
//

import UIKit
import ASValidator

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameErrorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    @IBOutlet weak var submitButton: UIButton!
    
    private let asValidator = ASValidator()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        asValidator.ignoreErrorAttempt()
        
        usernameTextField.register(asValidator, usernameErrorLabel,[ASVRequiredRule(), ASVMailRule()], "Email")
        usernameTextField.placeholder = "Enter Email Address"
        usernameTextField.delegate = self
        
        passwordTextField.register(asValidator, passwordErrorLabel, [ASVRequiredRule(), ASVMinLengthRule(6)], "Password")
        passwordTextField.placeholder = "Enter Password"
        passwordTextField.delegate = self
        
        asValidator.invalidDisableViews([submitButton])
        
        asValidator.hideKeyboardWhenTappedAround(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginEventHandler(_ sender: Any) {
        let validate = asValidator.apply()
        if let validate = validate, validate.isValid() {
            // MARK: - Validation Success
            print("Validation Success")
        }else{
            // MARK: - Validation Fail
            print("Validation Fail")
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    @available(iOS 10.0, *)
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        asValidator.applyForError(true)
    }
}

extension UITextField {
    func register(_ svalidator: ASValidator?, _ errorLabel: UILabel?, _ rules: [ASVRule]?, _ name: String? = nil, _ defaultErrorMsg: String? = nil) {
        registerASVTF(
            svalidator: svalidator,
            field: self,
            name: name,
            errorLabel: errorLabel,
            errorBorderView: self,
            errorBorderColor: UIColor.red.cgColor,
            normalBorderColor: UIColor.lightGray.cgColor,
            defaultErrorMsg: defaultErrorMsg,
            borderWidth: 1.0,
            rules: rules
        )
    }
}

