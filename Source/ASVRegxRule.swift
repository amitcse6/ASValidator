//
//  ASVPredicateRule.swift
//  Gonzo
//
//  Created by AMIT on 1/31/22.
//

import Foundation

public class ASVRegxRule: ASVRule {
    private var regx: String?
    private var errorMsg: String?
    
    public init(_ regx: String?, _ errorMsg: String? = nil) {
        self.regx = regx
        self.errorMsg = errorMsg
    }
    
    public func validate(_ value: Any?, _ fieldName: String?, _ defaultErrorMsg: String?) -> ASVError? {
        if let value = value as? String, let regx = regx, isValid(value, regx)  {
            return nil
        }
        return ASVError(errorMsg: errorMsg ?? defaultErrorMsg ?? "\(fieldName ?? "") is not correct")
    }
    
    func isValid(_ value: String, _ regx: String) -> Bool {
        let check = NSPredicate(format: "SELF MATCHES %@", regx)
        return check.evaluate(with: value)
    }
}
