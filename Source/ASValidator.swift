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
    
    public init() {
    }
    
    func append(_ svalidatorEntity: ASValidatorEntity) {
        svalidatorEntities.append(svalidatorEntity)
    }
    
    public func validate() -> ASValidation? {
        let asvalidation = ASValidation()
        for (_, entitie) in svalidatorEntities.enumerated() {
            let result = entitie.validate()
            asvalidation.results.append(result)
        }
        return asvalidation
    }
    
    @objc public func errorResetAll() {
        for (_, entitie) in svalidatorEntities.enumerated() {
            entitie.errorReset()
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
