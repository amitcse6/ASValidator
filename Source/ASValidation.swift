//
//  ASValidation.swift
//  superapp
//
//  Created by Amit on 30/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

public class ASValidation {
    public var results = [ASVResult]()
    
    public func isValid() -> Bool {
        for result in results {
            if result.errors.count != 0 {
                return false
            }
        }
        return true
    }
    
    public func showErrorLog() {
        results.forEach({ (result) in
            result.errors.forEach { (error) in
                if let errorMsg = error.errorMsg {
                    print(errorMsg)
                }
            }
        })
    }
}
