//
//  ASVEqualValueRule.swift
//  ASValidator
//
//  Created by Amit on 20/7/20.
//

import Foundation

public class ASVEqualRule: ASVRule {
    var errorMsg: String?
    var values: [String]?
    var number = 1
    
    public init(_ values: [String]?, _ errorMsg: String? = nil) {
        self.values = values
        self.errorMsg = errorMsg
    }
    
    public init(_ values: [String]?, _ number: Int?, _ errorMsg: String? = nil) {
        self.values = values
        self.number = number ?? 1
        self.errorMsg = errorMsg
    }
    
    public func validate(_ value: Any?, _ fieldName: String?, _ defaultErrorMsg: String?) -> ASVError? {
        if let value = (value as? String)?.trimmingCharacters(in: .whitespaces), let values = values, value.count > 0 {
            let _values = values.filter({ value == $0 })
            if _values.count >= number {
                return nil
            }
        }
        return ASVError(errorMsg: errorMsg ?? defaultErrorMsg ?? "\(fieldName ?? "") does not match")
    }
}
