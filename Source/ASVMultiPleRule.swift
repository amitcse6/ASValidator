//
//  ASVMultiPleRule.swift
//  ASValidator
//
//  Created by AMIT on 3/28/22.
//

import Foundation
import UIKit

public class ASVMultiPleRule: ASVRule {
    var errorMsg: String?
    var values: [Int64]?
    
    public init(_ values: [Int64]?, _ errorMsg: String? = nil) {
        self.values = values
        self.errorMsg = errorMsg
    }
    
    public func validate(_ value: Any?, _ fieldName: String?, _ defaultErrorMsg: String?) -> ASVError? {
        if let value = (value as? String)?.trimmingCharacters(in: .whitespaces), let values = values, value.count > 0, let number = Int64(value) {
            var isFound = false
            values.forEach { _value in
                if number%_value != 0 {
                    isFound = true
                }
            }
            if !isFound {
                return nil
            }
        }
        return ASVError(errorMsg: errorMsg ?? defaultErrorMsg ?? "\(fieldName ?? "") matches")
    }
}
