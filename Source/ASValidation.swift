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
            if result.sverrors.count != 0 {
                return false
            }
        }
        return true
    }
}
