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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameErrorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var buttonRef: UIButton!
    @IBOutlet weak var imageViewRef: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    
    private let asValidator = ASValidator()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        asValidator.removeAllEntities()
        asValidator.ignoreErrorAttempt()
        asValidator.delegate = self
        
        titleLabel.text = "Hi"
        titleLabel.register(asValidator, nil, [ASVRequiredRule("Title Require"), ASVMinLengthRule(10, "Title min 10")], "Title Ref")
        
        imageViewRef.register(asValidator, nil, [ASVImageRequiredRule("Image Require")], "Image Ref")
        imageViewRef.image = UIImage(named: "avatar")
        
        buttonRef.register(asValidator, nil, [ASVRequiredRule()], "Button Ref")
        buttonRef.setTitle("Button Title", for: .normal)
        
        usernameTextField.delegate = self
        usernameTextField.layer.borderColor = UIColor.gray.cgColor
        usernameTextField.register(asValidator, usernameErrorLabel,[ASVRequiredRule(), ASVMailRule()], "Email", nil, ASVErrorProps([usernameTextField, usernameTextField], nil, usernameTextField.backgroundColor, nil), "Any Object", "1")
        usernameTextField.text = "amit@gmail.com"
        usernameTextField.placeholder = "Enter Email Address"
        usernameTextField.delegate = self
        usernameTextField.layer.cornerRadius = 10
        
        textView.delegate = self
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.register(asValidator, usernameErrorLabel,[ASVRequiredRule(), ASVMinLengthRule(10)], "TextView", nil, ASVErrorProps([textView, textView], nil, textView.backgroundColor, nil), "Any Object", "1")
        textView.text = "Product details"
        
        usernameTextField.delegate = self
        passwordTextField.register(asValidator, passwordErrorLabel, [ASVRequiredRule(), ASVMinLengthRule(6), ASVMaxLengthRule(20, "Password max 10")], "Password")
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
    func validator(_ validator: ASValidator, _ entity: ASValidatorEntity?, _ result: ASVResult, _ isError: Bool) {
        if let field = entity?.getField() as? UITextField {
            print("\(String(describing: result.errors.first?.ruleIndex))")
            print("\(field)")
        }
        if let sender = entity?.getSender() as? String {
            print("sender: \(sender)")
        }
    }
}

extension ViewController: UITextViewDelegate {
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let entity = asValidator.getEntityByTag("1") {
            let result = entity.validate(true)
            print("result: \(result)")
        }
        asValidator.applyForError(true)
        return true
    }
    
    @available(iOS 10.0, *)
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        asValidator.applyForError(true)
    }
}
