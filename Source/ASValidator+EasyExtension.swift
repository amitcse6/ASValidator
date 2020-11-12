//
//  ASValidator+UIExtension.swift
//  ASValidator
//
//  Created by AMIT on 11/12/20.
//

import Foundation
import UIKit

extension UITextField {
    public func register(_ svalidator: ASValidator?, _ errorLabel: UILabel?, _ rules: [ASVRule]?, _ name: String? = nil, _ defaultErrorMsg: String? = nil) {
        registerASVTF(
            svalidator: svalidator,
            field: self,
            name: name,
            errorLabel: errorLabel,
            errorBorderView: self,
            errorBorderColor: UIColor.red.cgColor,
            normalBorderColor: UIColor.lightGray.cgColor,
            defaultErrorMsg: defaultErrorMsg,
            borderWidth: 1.0,
            rules: rules
        )
    }
}

extension UIButton {
    public func register(_ svalidator: ASValidator?, _ errorLabel: UILabel?, _ rules: [ASVRule]?, _ name: String? = nil, _ defaultErrorMsg: String? = nil) {
        registerASVTF(
            svalidator: svalidator,
            field: self,
            name: name,
            errorLabel: errorLabel,
            errorBorderView: self,
            errorBorderColor: UIColor.red.cgColor,
            normalBorderColor: UIColor.lightGray.cgColor,
            defaultErrorMsg: defaultErrorMsg,
            borderWidth: 1.0,
            rules: rules
        )
    }
}

extension UIImageView {
    public func register(_ svalidator: ASValidator?, _ errorLabel: UILabel?, _ rules: [ASVRule]?, _ name: String? = nil, _ defaultErrorMsg: String? = nil) {
        registerASVTF(
            svalidator: svalidator,
            field: self,
            name: name,
            errorLabel: errorLabel,
            errorBorderView: self,
            errorBorderColor: UIColor.red.cgColor,
            normalBorderColor: UIColor.lightGray.cgColor,
            defaultErrorMsg: defaultErrorMsg,
            borderWidth: 1.0,
            rules: rules
        )
    }
}
