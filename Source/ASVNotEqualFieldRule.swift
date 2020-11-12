//
//  ASVNotEqualFieldRule.swift
//  ASValidator
//
//  Created by Amit on 10/9/20.
//

import Foundation
import UIKit

public class ASVNotEqualFieldRule: ASVRule {
    private var errorMsg: String?
    private var field: UITextField?
    
    public init(_ field: UITextField?, _ errorMsg: String? = nil) {
        self.field = field
        self.errorMsg = errorMsg
    }
    
    public func validate(_ value: Any?) -> ASVError? {
        if let value = value as? String, let field = field, value != field.text {
            return nil
        }
        return ASVError(errorMsg: errorMsg ?? "match")
    }
}
