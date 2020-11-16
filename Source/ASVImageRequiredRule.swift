//
//  ASVImageRequiredRule.swift
//  ASValidator
//
//  Created by AMIT on 11/12/20.
//

import Foundation
import UIKit

public class ASVImageRequiredRule: ASVRule {
    var errorMsg: String?
    
    public init(_ errorMsg: String? = nil) {
        self.errorMsg = errorMsg
    }
    
    public func validate(_ value: Any?, _ fieldName: String?, _ defaultErrorMsg: String?) -> ASVError? {
        if let _ = value as? UIImage {
            return nil
        }
        return ASVError(errorMsg: errorMsg ?? defaultErrorMsg ?? "\(fieldName ?? "") matches")
    }
}
