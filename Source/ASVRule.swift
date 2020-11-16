
//
//  SVRules.swift
//  superapp
//
//  Created by Amit on 28/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

public protocol ASVRule {
    func validate(_ value: Any?, _ fieldName: String?, _ defaultErrorMsg: String?) -> ASVError?
}
