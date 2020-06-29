//
//  SValidator.swift
//  superapp
//
//  Created by Amit on 28/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

public class ASValidator: NSObject {
    private var svalidatorEntities: [ASValidatorEntity] = [ASValidatorEntity]()
    
    func append(_ svalidatorEntity: ASValidatorEntity) {
        svalidatorEntities.append(svalidatorEntity)
    }
    
    public func validate() -> SValidation? {
        let svalidation = SValidation()
        for (_, entitie) in svalidatorEntities.enumerated() {
            let result = entitie.validate()
            svalidation.results.append(result)
        }
        return svalidation
    }
    
    @objc public func errorResetAll() {
        for (_, entitie) in svalidatorEntities.enumerated() {
            entitie.errorReset()
        }
    }
}

public class SValidation: NSObject {
    var results = [ASVResult]()
    
    public func isValid() -> Bool {
        for result in results {
            if result.sverrors.count != 0 {
                return false
            }
        }
        return true
    }
}

extension UITextField {
    public func register(
        svalidator: ASValidator?,
        field: UITextField?,
        errorLabel: UILabel?,
        errorBorderView: UIView?,
        errorBorderColor: UIColor?,
        normalBorderColor: UIColor?,
        defaultErrorMsg: String?,
        borderWidth: CGFloat?,
        rules: [ASVRule]?
    ) {
        if let svalidator = svalidator { 
            svalidator.append(ASValidatorEntity(
                field: field,
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
