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
    @IBOutlet weak var buttonRef: UIButton!
    @IBOutlet weak var imageViewRef: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    
    private let asValidator = ASValidator()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        asValidator.ignoreErrorAttempt()
        asValidator.delegate = self
        
        imageViewRef.register(asValidator, nil, [ASVImageRequiredRule("Image Require")], "Image Ref")
        imageViewRef.image = UIImage(named: "avatar")
        
        buttonRef.register(asValidator, nil, [ASVRequiredRule()], "Button Ref")
        buttonRef.setTitle("Button Title", for: .normal)
        
        usernameTextField.layer.borderColor = UIColor.gray.cgColor
        usernameTextField.register(asValidator, usernameErrorLabel,[ASVRequiredRule(), ASVMailRule()], "Email")
        usernameTextField.text = "amit@gmail.com"
        usernameTextField.placeholder = "Enter Email Address"
        usernameTextField.delegate = self
        usernameTextField.layer.cornerRadius = 10
        
        passwordTextField.register(asValidator, passwordErrorLabel, [ASVRequiredRule(), ASVMinLengthRule(6)], "Password")
        passwordTextField.text = "11111111"
        passwordTextField.placeholder = "Enter Password"
        passwordTextField.delegate = self
        
        asValidator.invalidDisableViews([submitButton])
        asValidator.ignoreErrorAttempt(3)
        
        asValidator.hideKeyboardWhenTappedAround(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginEventHandler(_ sender: Any) {
        let validate = asValidator.apply()
        if let validate = validate, validate.isValid() {
            // MARK: - Validation Success
            print("Validation Success ")
        }else{
            // MARK: - Validation Fail
            print("Validation Fail")
            validate?.showErrorLog()
        }
    }
    
}

extension ViewController: ASValidatorDelegate {
    func validator(_ validator: ASValidator, _ field: Any?, _ result: ASVResult, _ isError: Bool) {
        if let _ = field as? UITextField {
            print("\(String(describing: result.errors.first?.ruleIndex))")
        }
    }
}

extension ViewController: UITextFieldDelegate {
    @available(iOS 10.0, *)
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        asValidator.applyForError(true)
    }
}
