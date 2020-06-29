//
//  SValidatorEntity.swift
//  superapp
//
//  Created by Amit on 28/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

public class ASValidatorEntity: NSObject {
    var field: UITextField?
    var errorLabel: UILabel?
    var errorBorderView: UIView?
    var errorBorderColor: UIColor?
    var normalBorderColor: UIColor?
    var defaultErrorMsg: String?
    var borderWidth: CGFloat?
    var rules: [ASVRule]?
    
    
    
    init(
        field: UITextField?,
        errorLabel: UILabel?,
        errorBorderView: UIView?,
        errorBorderColor: UIColor? = .red,
        normalBorderColor: UIColor? = UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0),
        defaultErrorMsg: String?,
        borderWidth: CGFloat? = 1.0,
        rules: [ASVRule]?) {
        self.field = field
        self.errorLabel = errorLabel
        self.errorBorderView = errorBorderView
        self.errorBorderColor = errorBorderColor
        self.normalBorderColor = normalBorderColor
        self.defaultErrorMsg = defaultErrorMsg
        self.borderWidth = borderWidth
        self.rules = rules
    }
    
    func validate() -> ASVResult {
        let svresult = ASVResult()
        if let rules = rules {
            for (_, rule) in rules.enumerated() {
                if let error = rule.validate(field?.text) {
                    svresult.sverrors.append(error)
                }
            }
        }
        setErrorMessage(svresult)
        return svresult
    }
    
    func setErrorMessage(_ svresult: ASVResult) {
        if let sverror = svresult.sverrors.first {
            setErrorBorderColor(sverror.errorMsg ?? "Invalid \(defaultErrorMsg ?? "Input!")")
        }else{
            setNormalBorderColor("")
        }
    }
    
    func errorReset() {
        setNormalBorderColor("")
    }
}

extension ASValidatorEntity {
    func setErrorBorderColor(_ errorMsg: String) {
        if let errorBorderView = errorBorderView {
            errorBorderView.layer.borderWidth = borderWidth ?? 0
            errorBorderView.layer.borderColor = errorBorderColor?.cgColor
        }
        if let errorLabel = errorLabel {
            errorLabel.text = errorMsg
        }
    }
    
    func setNormalBorderColor(_ errorMsg: String) {
        if let errorBorderView = errorBorderView {
            errorBorderView.layer.borderWidth = borderWidth ?? 0
            errorBorderView.layer.borderColor = normalBorderColor?.cgColor
        }
        if let errorLabel = errorLabel {
            errorLabel.text = errorMsg
        }
    }
}
