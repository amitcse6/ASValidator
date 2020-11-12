//
//  SRequiredRule.swift
//  superapp
//
//  Created by Amit on 28/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

public class ASVRequiredRule: ASVRule {
    var errorMsg: String?
    
    public init(_ errorMsg: String? = nil) {
        self.errorMsg = errorMsg
    }
    
    public func validate(_ value: Any?) -> ASVError? {
        if let value = (value as? String)?.trimmingCharacters(in: .whitespaces), value.count > 0 {
            return nil
        }
        return ASVError(errorMsg: errorMsg ?? "required")
    }
}
