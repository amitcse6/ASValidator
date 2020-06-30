//
//  ASVMailRule.swift
//  superapp
//
//  Created by Amit on 29/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

public class ASVMailRule: ASVRule {
    private var errorMsg: String?
    
    public init(_ errorMsg: String? = nil) {
        self.errorMsg = errorMsg
    }
    
    public func validate(_ value: String?) -> ASVError? {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if let value = value?.trimmingCharacters(in: .whitespaces), emailPred.evaluate(with: value)  {
            return nil
        }
        return ASVError(errorMsg: errorMsg ?? "is not correct")
    }
}
