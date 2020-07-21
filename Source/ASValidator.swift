//
//  SValidator.swift
//  superapp
//
//  Created by Amit on 28/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public class ASValidator {
    private var svalidatorEntities: [ASValidatorEntity] = [ASValidatorEntity]()
    private var invalidActionView: [Any?]?
    private var invalidActionViewDisable: Bool?
    private var firstInvalidAttemptNumberStore: Int = 0
    private var firstInvalidAttemptNumber: Int = 0
    
    public init() {
    }
    
    public init(_ ignoreInitApplyNumber: Int) {
        ignoreInitApplyWithNumber(ignoreInitApplyNumber)
    }
    
    
    func append(_ svalidatorEntity: ASValidatorEntity) {
        svalidatorEntities.append(svalidatorEntity)
    }
    
    // MARK: - Target Validation Handler
    public func targetValidationHandler(_ isShowError: Bool? = nil) -> ASValidation? {
        let asvalidation = ASValidation()
        for (_, entitie) in svalidatorEntities.enumerated() {
            let result = entitie.validate(isShowError ?? true)
            asvalidation.results.append(result)
        }
        return asvalidation
    }
    
    public func apply() -> ASValidation? {
        if firstInvalidAttemptNumber > 0 {
            self.firstInvalidAttemptNumber = self.firstInvalidAttemptNumber - 1
        }
        let asvalidation = targetValidationHandler(true)
        if let isValid = asvalidation?.isValid(), isValid {
            firstInvalidAttemptNumber = firstInvalidAttemptNumberStore
        }
        return asvalidation
    }
    
    @discardableResult
    public func applyForError(_ ignoreInitTime: Bool) -> ASValidation? {
        let asvalidation = targetValidationHandler(!ignoreInitTime)
        return asvalidation
    }

    public func invalidDisableViews(_ invalidActionView: [Any?]?, _ invalidActionViewDisable: Bool? = false) {
        self.invalidActionView = invalidActionView
        self.invalidActionViewDisable = invalidActionViewDisable
        if let invalidActionViewDisable = invalidActionViewDisable, invalidActionViewDisable {
            publicValidationHandler()
        }
    }
    
    public func ignoreInitApplyWithNumber(_ ignoreInitApplyNumber: Int = 1) {
        self.firstInvalidAttemptNumberStore = ignoreInitApplyNumber
        self.firstInvalidAttemptNumber = ignoreInitApplyNumber
    }
    
    @objc public func errorResetAll() {
        for (_, entitie) in svalidatorEntities.enumerated() {
            entitie.errorReset()
        }
    }
    
    public func resetAllValue() {
        svalidatorEntities.forEach { $0.resetValue() }
    }
    
    public func applyForError() {
        applyForError(true)
    }
    
    // MARK: - Public Validation Handler
    @objc public func publicValidationHandler() {
        let validate = targetValidationHandler(firstInvalidAttemptNumber == 0)
        if firstInvalidAttemptNumber == 0, let isValid = validate?.isValid(), let views = invalidActionView {
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

extension ASValidator {
    @objc public func hideKeyboardWhenTappedAround(_ view: UIView) {
        let tapGesture = ASVTapGestureRecognizer(target: self, action: #selector(hideKeyboard(_:)))
        tapGesture.setFirstObject(view)
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc public func hideKeyboard(_ sender: ASVTapGestureRecognizer) {
        if let view = sender.getFirstObject() as? UIView {
            view.endEditing(true)
        }
    }
}

public class ASVTapGestureRecognizer: UITapGestureRecognizer {
    var firstObject: Any?
    func setFirstObject(_ sender: Any?) {
        self.firstObject = sender
    }
    func getFirstObject() -> Any? {
        return self.firstObject
    }
}
