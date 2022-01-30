//
//  ASValidator+UIExtension.swift
//  ASValidator
//
//  Created by AMIT on 11/12/20.
//

import Foundation
import UIKit

extension UITextField {
    public func register(_ svalidator: ASValidator?, _ errorLabel: UILabel?, _ rules: [ASVRule]?, _ name: String? = nil, _ defaultErrorMsg: String? = nil, _ errorProps: ASVErrorProps? = nil) {
        registerASVTF(
            svalidator: svalidator,
            field: self,
            name: name,
            errorLabel: errorLabel,
            errorBorderView: self,
            errorBorderColor: svalidator?.getErrorBorderHilight() ?? false ? UIColor.red.cgColor : nil,
            normalBorderColor: svalidator?.getErrorBorderHilight() ?? false ? UIColor.lightGray.cgColor : nil,
            defaultErrorMsg: defaultErrorMsg,
            borderWidth: svalidator?.getErrorBorderHilight() ?? false ? 1.0 : nil,
            rules: rules,
            errorProps: errorProps
        )
    }
}

extension UIButton {
    public func register(_ svalidator: ASValidator?, _ errorLabel: UILabel?, _ rules: [ASVRule]?, _ name: String? = nil, _ defaultErrorMsg: String? = nil, _ errorProps: ASVErrorProps? = nil) {
        registerASVTF(
            svalidator: svalidator,
            field: self,
            name: name,
            errorLabel: errorLabel,
            errorBorderView: self,
            errorBorderColor: svalidator?.getErrorBorderHilight() ?? false ? UIColor.red.cgColor : nil,
            normalBorderColor:svalidator?.getErrorBorderHilight() ?? false ?  UIColor.lightGray.cgColor : nil,
            defaultErrorMsg: defaultErrorMsg,
            borderWidth: svalidator?.getErrorBorderHilight() ?? false ? 1.0 : nil,
            rules: rules,
            errorProps: errorProps
        )
    }
}

extension UIImageView {
    public func register(_ svalidator: ASValidator?, _ errorLabel: UILabel?, _ rules: [ASVRule]?, _ name: String? = nil, _ defaultErrorMsg: String? = nil, _ errorProps: ASVErrorProps? = nil) {
        registerASVTF(
            svalidator: svalidator,
            field: self,
            name: name,
            errorLabel: errorLabel,
            errorBorderView: self,
            errorBorderColor: svalidator?.getErrorBorderHilight() ?? false ? UIColor.red.cgColor : nil,
            normalBorderColor: svalidator?.getErrorBorderHilight() ?? false ? UIColor.lightGray.cgColor : nil,
            defaultErrorMsg: defaultErrorMsg,
            borderWidth: svalidator?.getErrorBorderHilight() ?? false ? 1.0 : nil,
            rules: rules,
            errorProps: errorProps
        )
    }
}
