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
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let asValidator = ASValidator()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        usernameTextField.addField(svalidator: asValidator, defaultErrorMsg: nil, rules: [ASVRequiredRule()])
        usernameTextField.delegate = self
        
        passwordTextField.addField(svalidator: asValidator, defaultErrorMsg: nil, rules: [ASVRequiredRule()])
        passwordTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginEventHandler(_ sender: Any) {
        let validate = asValidator.validate()
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
        asValidator.errorResetAll()
    }
}

extension UITextField {
    func addField(svalidator: ASValidator?, defaultErrorMsg: String?, rules: [ASVRule]?) {
        register(
            svalidator: svalidator,
            field: self,
            errorLabel: nil,
            errorBorderView: self,
            errorBorderColor: .red,
            normalBorderColor: .gray,
            defaultErrorMsg: defaultErrorMsg,
            borderWidth: 1.0,
            rules: rules
        )
    }
}

