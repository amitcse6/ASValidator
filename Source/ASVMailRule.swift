//
//  ASVMailRule.swift
//  superapp
//
//  Created by Amit on 29/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

public class ASVMailRule: ASVRule {
    var errorMsg: String?
    
    public init(_ errorMsg: String? = nil) {
        self.errorMsg = errorMsg
    }
    
    public func validate(_ value: String?) -> ASVError? {
        if let value = value?.trimmingCharacters(in: .whitespaces), value.count > 0 {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            if emailPred.evaluate(with: value) {
                return nil
            }
        }
        return ASVError(errorMsg: nil)
    }
}
