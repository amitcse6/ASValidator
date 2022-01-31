//
//  SVError.swift
//  superapp
//
//  Created by Amit on 28/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

public class ASVError { 
    public var errorMsg: String?
    public var ruleIndex: Int!
    
    public init(errorMsg: String?) {
        self.errorMsg = errorMsg
    }
}
