//
//  ASVLengthRule.swift
//  superapp
//
//  Created by Amit on 30/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

public class ASVLengthRule: ASVRule {
    private var errorMsg: String?
    private var length: Int
    
    public init(_ length: Int, _ errorMsg: String? = nil) {
        self.length = length
        self.errorMsg = errorMsg
    }
    
    public func validate(_ value: Any?) -> ASVError? {
        if let value = (value as? String)?.trimmingCharacters(in: .whitespaces), value.count >= length {
            return nil
        }
        return ASVError(errorMsg: errorMsg ?? "required minimum \(length) character\(ASVMath.getSigOrPlu(length))") 
    }
}

