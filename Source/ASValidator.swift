//
//  SValidator.swift
//  superapp
//
//  Created by Amit on 28/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

public class ASValidator {
    private var svalidatorEntities: [ASValidatorEntity] = [ASValidatorEntity]()
    private var invalidActionView: [Any?]?
    private var invalidActionViewDisable: Bool?
    
    public init() {
    }
    
    func append(_ svalidatorEntity: ASValidatorEntity) {
        svalidatorEntities.append(svalidatorEntity)
    }
    
    public func validate(_ isShowError: Bool? = nil) -> ASValidation? {
        let asvalidation = ASValidation()
        for (_, entitie) in svalidatorEntities.enumerated() {
            let result = entitie.validate(isShowError ?? true)
            asvalidation.results.append(result)
        }
        return asvalidation
    }
    
    public func invalidDisableViews(_ invalidActionView: [Any?]?, _ invalidActionViewDisable: Bool? = false) {
        self.invalidActionView = invalidActionView
        self.invalidActionViewDisable = invalidActionViewDisable
        if let invalidActionViewDisable = invalidActionViewDisable, invalidActionViewDisable {
            invalidAction()
        }
    }
    
    @objc public func errorResetAll() {
        for (_, entitie) in svalidatorEntities.enumerated() {
            entitie.errorReset()
        }
    }
    
    @objc public func invalidAction() {
        let validate = self.validate(true)
        if let isValid = validate?.isValid(), let views = invalidActionView {
            for (_, view) in views.enumerated() {
                let view = view as? UIView
                view?.isUserInteractionEnabled = isValid
                view?.alpha = !isValid ? 0.3 : 1.0
                if let invalidActionViewDisable = invalidActionViewDisable, invalidActionViewDisable {
                    view?.isHidden = !isValid ? true : false
                }
            }
        }
    }
}

extension UITextField {
    public func registerASVTF(
        svalidator: ASValidator?,
        field: UITextField?,
        name: String?,
        errorLabel: UILabel?,
        errorBorderView: UIView?,
        errorBorderColor: CGColor?,
        normalBorderColor: CGColor?,
        defaultErrorMsg: String?,
        borderWidth: CGFloat?,
        rules: [ASVRule]?
    ) {
        if let svalidator = svalidator { 
            svalidator.append(ASValidatorEntity(
                field: field,
                name: name,
                errorLabel: errorLabel,
                errorBorderView: errorBorderView,
                errorBorderColor: errorBorderColor,
                normalBorderColor: normalBorderColor,
                defaultErrorMsg: defaultErrorMsg,
                borderWidth: borderWidth,
                rules: rules
            ))
        }
    }
}
