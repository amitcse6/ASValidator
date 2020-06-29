//
//  SVError.swift
//  superapp
//
//  Created by Amit on 28/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

public class ASVError: NSObject { 
    var errorMsg: String?
    
    public init(errorMsg: String?) {
        self.errorMsg = errorMsg
    }
}
