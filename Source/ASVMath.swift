//
//  ASVMath.swift
//  superapp
//
//  Created by Amit on 30/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

class ASVMath {
}

extension ASVMath {
    static func getSigOrPlu(_ value: Int) -> String {
        return value > 1 ? "s" : ""
    }
    static func checkString(_ value: String?) -> String {
        return (value ?? "").count > 0 ? "\(value ?? "") " : ""
    }
}
