//
//  SValidator.swift
//  superapp
//
//  Created by Amit on 28/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit


public protocol ASValidatorDelegate: AnyObject {
    func validator(_ validator: ASValidator, _ entity: ASValidatorEntity?, _ result: ASVResult, _ isError: Bool)
}

public class ASValidator {
    private var svalidatorEntities: [ASValidatorEntity] = [ASValidatorEntity]()
    private var invalidActionView: [Any?]?
    private var invalidActionViewDisable: Bool?
    private var _numberOfErrorAttempt: Int = 0
    private var numberOfErrorAttempt: Int = 0
    private var errorBorderHilighted = true
    
    
    public weak var delegate: ASValidatorDelegate?
    
    public init() {
    }
    
    public init(_ ignoreInitApplyNumber: Int) {
        ignoreErrorAttempt(numberOfErrorAttempt)
    }
    
    func append(_ svalidatorEntity: ASValidatorEntity) {
        svalidatorEntities.append(svalidatorEntity)
    }
    
    // MARK: - Target Validation Handler
    public func targetValidationHandler(_ isShowError: Bool? = nil) -> ASValidation? {
        let asvalidation = ASValidation()
        for (_, entity) in svalidatorEntities.enumerated() {
            let result = entity.validate(isShowError ?? true)
            result.entity = entity
            asvalidation.results.append(result)
            delegate?.validator(self, entity, result, result.errors.count > 0)
        }
        return asvalidation
    }
    
    @discardableResult
    public func apply() -> ASValidation? {
        if numberOfErrorAttempt > 0 {
            self.numberOfErrorAttempt = self.numberOfErrorAttempt - 1
        }
        publicValidationHandler()
        let asvalidation = targetValidationHandler(true)
        if let isValid = asvalidation?.isValid(), isValid {
            numberOfErrorAttempt = _numberOfErrorAttempt
        }else{
        }
        return asvalidation
    }
    
    public func getEntityByTag(_ tag: String) -> ASValidatorEntity? {
        return svalidatorEntities.first { asValidatorEntity in
            return asValidatorEntity.tag == tag
        }
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
    
    
    public func setErrorBorderHilight(_ hilighted: Bool) {
        self.errorBorderHilighted = hilighted
    }
    
    public func getErrorBorderHilight() -> Bool {
        return errorBorderHilighted
    }
    
    public func ignoreErrorAttempt(_ number: Int = 1) {
        self._numberOfErrorAttempt = number
        self.numberOfErrorAttempt = number
    }
    
    public func removeAllEntities() {
        self.svalidatorEntities.removeAll()
        self.svalidatorEntities = []
    }
    
    
    @objc public func errorResetAll() {
        for (_, entitie) in svalidatorEntities.enumerated() {
            entitie.errorReset()
        }
    }
    
    @objc public func resetAllValue() {
        svalidatorEntities.forEach { $0.resetValue() }
    }
    
    @objc public func applyForError() {
        applyForError(true)
    }
    
    // MARK: - Public Validation Handler
    @objc public func publicValidationHandler() {
        let validate = targetValidationHandler(numberOfErrorAttempt == 0)
        if numberOfErrorAttempt == 0, let isValid = validate?.isValid(), let views = invalidActionView {
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
