//
//  ASVMinLengthRule.swift
//  superapp
//
//  Created by Amit on 29/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

public class ASVMinLengthRule: ASVRule {
    var errorMsg: String?
    var length: Int
    
    public init(_ length: Int, _ errorMsg: String? = nil) {
        self.length = length
        self.errorMsg = errorMsg
    }
    
    public func validate(_ value: String?) -> ASVError? {
        if let value = value?.trimmingCharacters(in: .whitespaces), value.count >= length {
            return nil
        }
        return ASVError(errorMsg: nil)
    }
}
