//
//  ASVEqualFieldRule.swift
//  ASForm_Example
//
//  Created by Amit on 14/7/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

public class ASVEqualFieldRule: ASVRule {
    private var errorMsg: String?
    private var field: UITextField?
    
    public init(_ field: UITextField?, _ errorMsg: String? = nil) {
        self.field = field
        self.errorMsg = errorMsg
    }
    
    public func validate(_ value: Any?, _ fieldName: String?, _ defaultErrorMsg: String?) -> ASVError? {
        if let value = value as? String, let field = field, value == field.text {
            return nil
        }
        return ASVError(errorMsg: errorMsg ?? defaultErrorMsg ?? "\(fieldName ?? "") does not match")
    }
}
