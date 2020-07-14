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
    
    public func validate(_ value: String?) -> ASVError? {
        if let value = value, let field = field, value == field.text {
            return nil
        }
        return ASVError(errorMsg: errorMsg ?? "does not match")
    }
}
