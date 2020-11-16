//
//  SValidatorEntity.swift
//  superapp
//
//  Created by Amit on 28/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public class ASValidatorEntity {
    private var field: Any?
    private var name: String?
    private var errorLabel: UILabel?
    private var errorBorderView: UIView?
    private var errorBorderColor: CGColor?
    private var normalBorderColor: CGColor?
    private var defaultErrorMsg: String?
    private var borderWidth: CGFloat?
    private var rules: [ASVRule]?
    
    init(
        field: AnyObject?,
        name: String?,
        errorLabel: UILabel?,
        errorBorderView: UIView?,
        errorBorderColor: CGColor?,
        normalBorderColor: CGColor?,
        defaultErrorMsg: String?,
        borderWidth: CGFloat? = 1.0,
        rules: [ASVRule]?
    ) {
        self.field = field
        self.name = name
        self.errorLabel = errorLabel
        self.errorBorderView = errorBorderView
        self.errorBorderColor = errorBorderColor
        self.normalBorderColor = normalBorderColor
        self.defaultErrorMsg = defaultErrorMsg
        self.borderWidth = borderWidth
        self.rules = rules
    }
    
    func validate(_ isShowError: Bool) -> ASVResult {
        let svresult = ASVResult()
        if let rules = rules {
            for (_, rule) in rules.enumerated() {
                if let field = field as? UITextField, let error = rule.validate(field.text, name, defaultErrorMsg) {
                    svresult.errors.append(error)
                }else if let field = field as? UIButton, let error = rule.validate(field.titleLabel?.text, name, defaultErrorMsg) {
                    svresult.errors.append(error)
                }else if let field = field as? UIImageView, let error = rule.validate(field.image, name, defaultErrorMsg) {
                    svresult.errors.append(error)
                }
            }
        }
        if isShowError {
            setErrorMessage(svresult)
        }
        return svresult
    }
    
    func getErrorMessage(_ errorMsg: String?) -> String? {
        if var errorMsg = errorMsg {
            errorMsg = (defaultErrorMsg ?? "Invalid \(name ?? "input")")
            errorMsg = "\(ASVMath.checkString(name))\(errorMsg)"
            return errorMsg
        }
        return nil
    }
    
    func getErrorMessage(_ svresult: ASVResult) -> String? {
        for sverror in svresult.errors {
            if let errorMsg = getErrorMessage(sverror.errorMsg) {
                return errorMsg
            }
        }
        return nil
    }
    
    func setErrorMessage(_ svresult: ASVResult) {
        if let errorMsg = getErrorMessage(svresult) {
            setErrorStyle(errorMsg)
        }else{
            setNormalStyle("")
        }
    }
    
    func errorReset() {
        setNormalStyle("")
    }
    
    func resetValue() {
        if let field = field as? UITextField {
            field.text = ""
        }else if let field = field as? UIButton {
            field.setTitle("", for: .normal)
        }
    }
}

extension ASValidatorEntity {
    func setErrorStyle(_ errorMsg: String) {
        if let errorBorderView = errorBorderView {
            errorBorderView.layer.borderWidth = borderWidth ?? 0
            errorBorderView.layer.borderColor = errorBorderColor
        }
        if let errorLabel = errorLabel {
            errorLabel.text = errorMsg
        }
    }
    
    func setNormalStyle(_ errorMsg: String) {
        if let errorBorderView = errorBorderView {
            errorBorderView.layer.borderWidth = borderWidth ?? 0
            errorBorderView.layer.borderColor = normalBorderColor
        }
        if let errorLabel = errorLabel {
            errorLabel.text = errorMsg
        }
    }
}
